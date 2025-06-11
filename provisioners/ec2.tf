resource "aws_instance" "roboshop" {
  ami           = var.ami_id  # left and right side names should not be the same
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]

tags =var.ec2_tags

    provisioner "local-exec" {
      
            command = "echo private_IP ${self.public_ip} >>private_IP.txt"
            on_failure = continue
  }

    provisioner "local-exec" {
        
            command = "echo public_IP ${self.public_ip} >> public_IP.txt"
            on_failure = continue
  }

    connection {
              type     = "ssh"
              user     = "ec2-user"
              password = "DevOps321"
              host     = self.public_ip
  }

   provisioner "remote-exec" {
                inline = [
                  "sudo dnf install nginx -y",
                  "sudo systemctl start nginx",
                ]

  }

   provisioner "remote-exec" {
             when  = destroy 
                inline = [
                  "sudo systemctl stop nginx",
                   
                ]

  }
    provisioner "local-exec" {
    when    = destroy   # this block will run wile excutiong the TERRAFORM DESTROY
    command = "echo 'EC2_INSTANCE IS DETROYPED'"
  }
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