terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.1"
    }
  }
  required_version = ">= 1.2.0"
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP inbound traffic and all outbound traffic"
  tags = {
    Name = "allow-ssh-http"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # all ports
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 8080
  to_port           = 8081
}

resource "aws_vpc_security_group_ingress_rule" "allow_http2" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_instance" "tf-web-server" {
    ami = "ami-080e1f13689e07408"
    instance_type = "t2.micro"
    key_name = "vockey"
    associate_public_ip_address = "true"
    vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
    user_data = <<-EOF
    #!/bin/bash
    
    apt update -y
    apt install -y curl
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    usermod -aG docker ubuntu
    systemctl enable docker 
    systemctl start docker
    
    cd /home/ubuntu/
    
    git clone https://github.com/sergiojdp/tictactoe.git
    
    cd /home/ubuntu/tictactoe/frontend
    docker build -t myfrontend:v1 -t myfrontend:latest .
    docker run --name front -p 80:80 myfrontend
    #docker build -t ttt_prueba:latest .
    #docker run -d -p 8081:3000 ttt_prueba:latest
    
    EOF
    user_data_replace_on_change = true
    tags = {
        Name = "TicTacToe"
    }
}