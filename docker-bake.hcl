variable "REGISTRY" {
  default = "ghcr.io/miracum"
}

variable "TAG" {
  default = "latest"
}

group "default" {
  targets = ["app", "app-test"]
}

target "app" {
  context    = "."
  dockerfile = "Dockerfile"
  tags       = ["${REGISTRY}/github-reusable-workflow-bake:${TAG}"]
}

target "app-test" {
  context    = "."
  dockerfile = "Dockerfile"
  target     = "test"
  tags       = ["${REGISTRY}/github-reusable-workflow-bake-test:${TAG}"]
}
