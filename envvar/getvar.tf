data "external" "example" {
 program = ["./mypwd"]
}

output "pwd" {
  value = data.external.example.result.dir
}
