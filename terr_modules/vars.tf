variable "AWS_REGION" {
    default = "us-east-1"
}

variable "AMI" {
    type = "map"
    default = {
        eu-central-1 = "ami-0767046d1677be5a0"
        us-east-1 = "ami-042e8287309f5df03"
    }
}

variable "INSTANCE_TYPE" {
    default = "t3.xlarge"
}

variable "PUBLIC_KEY_PATH" {
    default = "~/.ssh/pdc-key-pair.pub"
}

variable "PRIVATE_KEY_PATH"{
    default = "~/.ssh/pdc-key-pair"
}

variable "COUNT" {
    default = 1
}