<h2> Trivy image scan report</h2>
{{- if . }}
{{- range . }}
<h3><code>{{ escapeXML .Target }}</code></h3>
{{- if eq .Class "secret" }}
<h4>{{ len .Secrets }} secret(s) found</h4>
<details>
    <summary>Show detailed table of secrets</summary>
    <table>
        <tr>
            <th>Rule</th>
            <th>Title</th>
            <th>Severity</th>
            <th>Line</th>
        </tr>
        {{- range .Secrets }}
        <tr>
            <td>{{ escapeXML .RuleID }}</td>
            <td>{{ escapeXML .Title }}</td>
            <td>{{ escapeXML .Severity }}</td>
            <td>{{ .StartLine }}</td>
        </tr>
        {{- end }}
    </table>
</details>
{{- else if eq .Class "config" }}
<h4>{{ len .Misconfigurations }} misconfiguration(s) found</h4>
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
            <br><a href={{ escapeXML .PrimaryURL | printf "%q" }}>{{ escapeXML .PrimaryURL }}</a>
            </td>
        </tr>
        {{- end }}
    </table>
</details>
{{- else if (eq (len .Vulnerabilities) 0) }}
<h4>No Vulnerabilities found</h4>
{{- else }}
{{- $countBySeverity := dict "CRITICAL" 0 "HIGH" 0 "MEDIUM" 0 "LOW" 0 "UNKNOWN" 0 }}
{{- range .Vulnerabilities }}
{{- $_ := set $countBySeverity .Severity (add1 (get $countBySeverity .Severity)) }}
{{- end }}
{{- $counts := list }}
{{- range (list "CRITICAL" "HIGH" "MEDIUM" "LOW" "UNKNOWN") }}
{{- $counts = append $counts (printf "%s: %d" . (get $countBySeverity .)) }}
{{- end }}
<h4>{{ len .Vulnerabilities }} known vulnerabilities found ({{ join ", " $counts }})</h4>

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
{{- end }}
{{- else }}
<h3>Trivy Returned Empty Report</h3>
{{- end }}
