/* Setup our aws provider */
provider "aws" {
  access_key  = "${var.access_key}"
  secret_key  = "${var.secret_key}"
  region      = "${var.region}"
}

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
