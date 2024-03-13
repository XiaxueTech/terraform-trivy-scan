resource "aws_security_group" "ingress_test" {
    name        = "test"
    description = "Allow inbound"
    vpc_id      = data.aws_vpc.vpc.id
}

resource "aws_security_group_rule" "ingress_test" {
    type        = "ingress"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = var.public_cidr_block
    security_group_id = "${aws_security_group.ingress_test.id}"
}
