data "external" "example" {
 program = ["bash","./mypwd"]
}

output "pwd" {
  value = data.external.example.result.dir
}
