variable "ami_id" {
  type = string
  default = "ami-09c813fb71547fc4f"
  description = "RHEL-9 DEVOPS PRACTICE"
}

variable "instance_type" {
    type= string
    default = "t3.micro" 
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

variable "instances" {
       default = {
        mongodb = "t3.micro" # each keyword is assigned for every iteration. you will get each.key and each.value
        redis = "t3.micro"
        mysql = "t3.small"
        rabbitmq = "t3.micro"
     
    }
    # default = ["mongodb", "catalogue", "reddis", "user"]

  }

 

variable "domain_name" {
  default = "narendaws-84s.site"
  
}

variable "zone_id" {
  default = "Z0388521KFVW7JPV7X7D"
  
}

variable "ingress_ports" {
  default = [   #list[{maps},{maps}]
    { from_port        = 22
      to_port          = 22
    },
    { from_port        = 80
      to_port          = 80
    },
    { from_port        = 8080
      to_port          = 8080
    }
  ]  

  }  