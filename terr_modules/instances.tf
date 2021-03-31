terraform import aws_key_pair.pdc-key-pair pdc-key-pair

resource "aws_instance" "pdc_instance_1" {
    count = "${var.COUNT}"
    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "${var.INSTANCE_TYPE}"

    subnet_id = "${aws_subnet.prod-subnet-public-1.id}"

    vpc_security_group_ids = ["${aws_security_group.allowed_trafic.id}"]

    key_name = "${aws_key_pair.pdc-key-pair.id}"

    user_data = file("provision.sh")

    connection {
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }

    tags = {
        Name = "pdc-instance"
        Owner = "User"
    }
}

resource "aws_key_pair" "pdc-key-pair" {
    key_name = "pdc-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}