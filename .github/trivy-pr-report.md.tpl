<h2> Trivy image scan report</h2>
{{- if . }}
{{- range . }}
<h3><code>{{ escapeXML .Target }}</code></h3>
{{- if (eq (len .Vulnerabilities) 0) }}
<h4>No Vulnerabilities found</h4>
{{- else }}
{{ $countBySeverity := dict "CRITICAL" 0 "HIGH" 0 "MEDIUM" 0 "LOW" 0 }}
{{- range .Vulnerabilities }}
    {{- if eq .Severity "CRITICAL" }}
        {{ $currentCount := get $countBySeverity "CRITICAL" }}
        {{ $_ := set $countBySeverity "CRITICAL" (add1 $currentCount) }}
    {{- else if eq .Severity "HIGH" }}
        {{ $currentCount := get $countBySeverity "HIGH" }}
        {{ $_ := set $countBySeverity "HIGH" (add1 $currentCount) }}
    {{- else if eq .Severity "MEDIUM" }}
        {{ $currentCount := get $countBySeverity "MEDIUM" }}
        {{ $_ := set $countBySeverity "MEDIUM" (add1 $currentCount) }}
    {{- else if eq .Severity "LOW" }}
        {{ $currentCount := get $countBySeverity "LOW" }}
        {{ $_ := set $countBySeverity "LOW" (add1 $currentCount) }}
    {{- end }}
{{- end }}

{{ $vulnerabilityCountsFormatted := "" }}
{{- range (keys $countBySeverity) }}
{{ $vulnerabilityCountsFormatted = printf "%s %s: %d" ($vulnerabilityCountsFormatted | trim) . (get $countBySeverity .) }}
{{- end }}

<h4>{{ (len .Vulnerabilities) }} known vulnerabilities found ({{ $vulnerabilityCountsFormatted }})</h4>

<details>
    <summary>Show detailed table of vulnerabilities</summary>
    <table>
        <tr>
            <th>Package</th>
            <th>ID</th>
            <th>Severity</th>
            <th>Installed Version</th>
            <th>Fixed Version</th>
        </tr>
        {{- range .Vulnerabilities }}
        <tr>
            <td><code>{{ escapeXML .PkgName }}</code></td>
            <td>{{ escapeXML .VulnerabilityID }}</td>
            <td>{{ escapeXML .Severity }}</td>
            <td>{{ escapeXML .InstalledVersion }}</td>
            <td>{{ escapeXML .FixedVersion }}</td>
        </tr>
        {{- end }}
    </table>
</details>
{{- end }}

{{- if (eq (len .Misconfigurations ) 0) }}
<h4>No Misconfigurations found</h4>
{{- else }}
<h4>Misconfigurations</h4>
<details>
    <summary>Show detailed table of misconfigurations</summary>
    <table>
        <tr>
            <th>Type</th>
            <th>ID</th>
            <th>Check</th>
            <th>Severity</th>
            <th>Message</th>
        </tr>
        {{- range .Misconfigurations }}
        <tr>
            <td>{{ escapeXML .Type }}</td>
            <td>{{ escapeXML .ID }}</td>
            <td>{{ escapeXML .Title }}</td>
            <td>{{ escapeXML .Severity }}</td>
            <td>
            {{ escapeXML .Message }}
            <br><a href={{ escapeXML .PrimaryURL | printf "%q" }}>{{ escapeXML .PrimaryURL }}</a></br>
            </td>
        </tr>
        {{- end }}
    </table>
</details>
{{- end }}
{{- end }}
{{- else }}
<h3>Trivy Returned Empty Report</h3>
{{- end }}
