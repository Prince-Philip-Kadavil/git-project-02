provider "aws" {}

variable "project_name" {
  default = "zomato"
}

variable "project_env" {
  default = "prod"
}

resource "aws_security_group" "web_traffic" {

  name_prefix = "webserver-${var.project_name}-${var.project_env}"
  description = "allows http & https traffic only"

  ingress {

    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  ingress {

    from_port        = 443
    to_port          = 444
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    "Name" = "webserver-${var.project_name}-${var.project_env}"
  }

  lifecycle {
    create_before_destroy = true
  }

}
