# Launch Template

resource "aws_launch_template" "template" {
  name_prefix   = "terraform-template"
  image_id      = "ami-xxxxxxxx"
  instance_type = "t2.micro"

  key_name = aws_key_pair.main_key.key_name
}
