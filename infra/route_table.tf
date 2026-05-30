resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
}
