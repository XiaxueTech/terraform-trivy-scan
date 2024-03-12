data "aws_vpc" "egress" {
    default = true
}

resource "aws_security_group" "egress" {
    name        = "test"
    description = "Allow outbound"
    vpc_id      = data.aws_vpc.egress.id
}

resource "aws_security_group_rule" "egress" {
    type        = "egress"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [0.0.0.0/0]
    security_group_id = "${aws_security_group.egress.id}"
}
