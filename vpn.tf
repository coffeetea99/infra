provider "aws" {
  alias = "tokyo"
  region = "ap-northeast-1"
}

resource "aws_default_vpc" "tokyo_default_vpc" {
  provider = aws.tokyo

  tags = {
    Name = "tokyo_default_vpc"
  }
}

resource "aws_security_group" "wireguard" {
  provider = aws.tokyo

  name = "wireguard"
  vpc_id = aws_default_vpc.tokyo_default_vpc.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 51820
    to_port          = 51820
    protocol         = "udp"
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

resource "aws_key_pair" "aws_main" {
  provider = aws.tokyo

  key_name = "aws-main"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDXn4u1iz6BIaVH5alsmxAX8STzzeO2n/0oyqmeVoISPXEuODyIs+On7MpxIWtWzlcV5WwESXDAARIgMY5JLf1/QBIrJ2I36Ko8WPt1XE6AxDFqhOT3CuFtmYuZKmzlFmkDmk+0ozpICabJ1aznH+ELHw4WjPJM2TghvBXgWnl7Vxh0nVEd0DfXkiZG6zmAgPgFbY4r1CdQkR3bq//RmkZLOUJtN/EBJRRMjoC7RDM196HtMiWPuLRxC6zDFKz3C8mqgD/27gsjXbSvy68RTgAK2E1hn9QIS5HHffJN/CZqICHWD/joIp03H2NCCx8vLovHRRCNOv1lXlw/noMnYVrCfupsW931QqTBydZxg2f6RE8rfkIDfLzjWAFVFoOJJaHvp/5P0RVxF/Q2Ksuejjm5FgBvecCummFmyxDJZArYNLPjKjVb8FC1vWnKMVV5CS7I6jJ6Rw3hc/dZKYxsJC2cB35VEZVINfRw/xdE5aAJbVCP2iK2wTediWFnrZUoL5U= coffeetea99iro@gmail.com"
}
