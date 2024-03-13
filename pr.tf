resource "aws_security_group" "ingress_test" {
    name        = "test"
    description = "Allow inbound"
    vpc_id      = data.aws_vpc.vpc.id
}

resource "aws_security_group" "egress_test" {
    name        = "test"
    description = "Allow outbound"
    vpc_id      = data.aws_vpc.vpc.id
}

resource "aws_security_group_rule" "public_ingress_test" {
    type        = "ingress"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = var.public_cidr_block
    security_group_id = "${aws_security_group.ingress_test.id}"
}

resource "aws_security_group_rule" "private_ingress_test" {
    type        = "ingress"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = var.private_cidr_block
    security_group_id = "${aws_security_group.ingress_test.id}"
}

resource "aws_security_group_rule" "egress_test" {
    type        = "ingress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.egress_test.id}"
}
