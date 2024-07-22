resource "aws_default_vpc" "seoul_default_vpc" {
  tags = {
    Name = "seoul_default_vpc"
  }
}

resource "aws_security_group" "factorio_security_group" {
  name = "factorio_security_group"
  vpc_id = aws_default_vpc.seoul_default_vpc.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 34197
    to_port          = 34197
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "factorio_instance" {
  # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
  ami = "ami-0c9c942bd7bf113a2" 
  instance_type = "t3.micro"

  key_name = aws_key_pair.aws_main.key_name

  tags = {
    Name = "factorio_instance"
  }
}

resource "aws_key_pair" "aws_seoul_main" {
  key_name = "aws-main"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDXn4u1iz6BIaVH5alsmxAX8STzzeO2n/0oyqmeVoISPXEuODyIs+On7MpxIWtWzlcV5WwESXDAARIgMY5JLf1/QBIrJ2I36Ko8WPt1XE6AxDFqhOT3CuFtmYuZKmzlFmkDmk+0ozpICabJ1aznH+ELHw4WjPJM2TghvBXgWnl7Vxh0nVEd0DfXkiZG6zmAgPgFbY4r1CdQkR3bq//RmkZLOUJtN/EBJRRMjoC7RDM196HtMiWPuLRxC6zDFKz3C8mqgD/27gsjXbSvy68RTgAK2E1hn9QIS5HHffJN/CZqICHWD/joIp03H2NCCx8vLovHRRCNOv1lXlw/noMnYVrCfupsW931QqTBydZxg2f6RE8rfkIDfLzjWAFVFoOJJaHvp/5P0RVxF/Q2Ksuejjm5FgBvecCummFmyxDJZArYNLPjKjVb8FC1vWnKMVV5CS7I6jJ6Rw3hc/dZKYxsJC2cB35VEZVINfRw/xdE5aAJbVCP2iK2wTediWFnrZUoL5U= coffeetea99iro@gmail.com"
}
