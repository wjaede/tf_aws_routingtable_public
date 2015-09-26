/* Routing table  */
resource "aws_route_table" "rt_pub" {
  vpc_id = "${var.vpc_id}"
  route {
    cidr_block = "${var.rt_cidr}"
    gateway_id = "${var.igw_id}"
  }
  tags {
    Name = "rt_${var.rt_name}"
  }
}

/* Associate the routing table to public subnet */
resource "aws_route_table_association" "rta" {
  subnet_id = "${var.sbn_id}"
  route_table_id = "${aws_route_table.rt_pub.id}"
}
