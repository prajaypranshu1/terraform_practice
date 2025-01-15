provider "aws" {
    region = "ap-south-1"
}


resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "prajaydemo" {
    ami                    = "ami-053b12d3152c0cc71"
    instance_type          = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

    user_data_replace_on_change = true

    tags = {
    Name = "terraform-example-prajay"
  }
  
}
