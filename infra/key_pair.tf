# EC2 Key Pair

resource "aws_key_pair" "main_key" {
  key_name   = "terraform-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
