resource "aws_instance" "roboshop" {
  ami           = "data.aws_ami.joindevops.id"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = "Helooworld"
  }
}


resource "aws_security_group" "allow_all" {
  name = "allow_all"
  description = "allow all traffic"

    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"  #If you select a protocol of -1 (semantically equivalent to all
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
            }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"  #If you select a protocol of -1 (semantically equivalent to all
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
            }

  tags = {
    Name = "allow-all"
        }

}