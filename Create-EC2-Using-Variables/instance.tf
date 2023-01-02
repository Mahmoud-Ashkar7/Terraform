resource "aws_instance" "dov-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "new-dove"
  vpc_security_group_ids = ["sg-053eac178fc97c359"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
}