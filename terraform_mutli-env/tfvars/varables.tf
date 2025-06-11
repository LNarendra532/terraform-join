variable "ami_id" {
  type = string
  default = "ami-09c813fb71547fc4f"
  description = "RHEL-9 DEVOPS PRACTICE"
}

variable "instance_type" {
   
}

variable "ec2_tags" {
  
  type= map(string)
  default = {
    "Name" = "Hello_ec2"
    description="varbles demo "
  }
}


variable "sg_name" {
  default = "allow_all"
}



variable "sg_description" {
    default = "allow all traffic"
}



variable "from_port" {
    type =number
    default = 0  
}


variable "to_port" {
    type =number
    default = 0
}

variable "cidr_blocks" {
    type= list(string)
  default = ["0.0.0.0/0"]
}

variable "protocol" {
    type = string
   default = "-1"  
}

variable "ipv6_cidr_blocks" {
    type=list(string)
    default =["::/0"]
  
}

variable "sg_tags" {

    type =map(string)
    default = {
      Name= "allow-all"
      description= "sg_tags"
    }
  
}


variable "domain_name" {
  default = "narendaws-84s.site"
  
}

variable "zone_id" {
  default = "Z0388521KFVW7JPV7X7D"
  
}

variable "environment" {
  
}

variable "common_tags" {
  default = {
      Project ="Roboshop"
      Terraform ="true"
  }
}

variable "instances" {

default = ["mongo", "reddis"]

}

variable "project" {
  default = "Roboshop"
  
}