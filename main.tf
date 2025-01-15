provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "prajaydemo" {
    ami           = "ami-053b12d3152c0cc71"
    instance_type = "t2.micro"

    tags = {
    Name = "terraform-example-prajay"
  }
  
}
