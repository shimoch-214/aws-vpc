locals {
  service_name = var.service_name
  az = slice([
    "ap-northeast-1a",
    "ap-northeast-1c",
    "ap-northeast-1d"
  ], 0, var.redundancy)
}
