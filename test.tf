data "aws_vpc" "test3" {
  default = true
}

resource "aws_security_group" "test3" {
    name        = "test3"
    vpc_id      = data.aws_vpc.test3.id
}

resource "aws_security_group_rule" "test3" {
    type               = "ingress"
    from_port         = 0
    to_port           = 65535
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.test3.id}"
}
