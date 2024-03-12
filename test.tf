
data "aws_vpc" "test1" {
    default = true
}

resource "aws_security_group" "test1" {
    name        = "test1"
    description = "Allow inbound traffic"
    vpc_id      = data.aws_vpc.test1.id
}

resource "aws_security_group_rule" "test1" {
    type        = "ingress"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.test1.id}"
}


resource "aws_security_group" "testvar" {
    name        = "testvar"
    description = "Allow inbound traffic"
    vpc_id      = data.aws_vpc.test1.id
}

resource "aws_security_group_rule" "testvar" {
    type        = "ingress"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = var.public_cidr_block
    security_group_id = "${aws_security_group.testvar.id}"
}
