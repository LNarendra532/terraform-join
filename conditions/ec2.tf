resource "aws_instance" "roboshop" {
  count = 4
  ami           = var.ami_id  # left and right side names should not be the same
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"  #var.a == "" ? "if_true" : if_true  [teranary operation]
  vpc_security_group_ids = [aws_security_group.allow_all.id]

tags =var.ec2_tags

}

resource "aws_security_group" "allow_all" {
  name = var.sg_name
  description = var.sg_description

    ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol  #If you select a protocol of -1 (semantically equivalent to all
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
            }

    egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol  #If you select a protocol of -1 (semantically equivalent to all
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
            }

    tags = var.sg_tags


}