resource "aws_instance" "intro" {
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "dove-key"
  vpc_security_group_ids = ["sg-053eac178fc97c359"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  } 
}