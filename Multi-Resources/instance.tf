resource "aws_key_pair" "dove-key" {
  key_name   = "dovekey"
  public_key = file("dovekey.pub")
}
resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = ["sg-053eac178fc97c359"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }
  connection {
    user        = var.USER
    private_key = file("dovekey")
    host        = self.public_ip
  }
}

resource "aws_ebs_volume" "vol_4_dove" {
  availability_zone = var.ZONE1
  size              = 40

  tags = {
    Name = "extr-vol-4-dove"
  }
}
resource "aws_volume_attachment" "atch_vol_dove" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4.id
  instance_id = aws_instance.dove-inst.id
}
output "PublicIP" {
  value = aws_instnace.dove-inst.public_ip
}
output "PrivateIP" {
  value = aws_instance.dove-inst.private_ip
}