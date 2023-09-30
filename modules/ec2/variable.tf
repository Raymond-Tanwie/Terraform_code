variable "instancetype" {
    default = "t2.micro"
}
variable "keypair" {
    default = "for-tomcat"
}

variable "sg" {
    
}

variable "KeyName" {
    default = "~/.ssh/id_rsa.pub"

}

variable "subnetId" {

}


/*variable "userData" {
    
}*/

variable "tags" {
    default = "test"
  
}
