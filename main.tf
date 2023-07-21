provider "aws" {
    region = "eu-west-1"
}

resource "aws_key_pair" "deployer" {
      public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpeonI/swURd9ft1S+oC2I6fldZfmLwQbrfCbWnPYXVifVwbP1w7KjTUj7NtikBGP4TopsQL4/RaFlQRZuyG6TxJ8ww0SX/Pdl6gc/NT/EA0rDRPyirb4bNGms2Y/8ncemZpgYI06K6CxmhIWJwyqGat7HbndkNLBr1lfIpNYo4PiT/dxu2gIjr7K4wU8TKTUwgDM6eN+p5dLwon9bhMDXuH5A9giPBATxo7w26icE9EFyA69QqO4aN9alMT6bzbe+HotI2MwZp/B1/7yvvwCLE1fy+9i/6dMvAvJbASGGp8I0fpxorfPyPdggOZ5LJKxKxx0RCtFMkSttYAkLBlAbXmnuSm95J1mgkSZX8KmcjIxDXbeMJCDu3AkzCHnjZUaDkOsxRZLy+PQaDbYd6UWSZDPDCTovWWz3dDOfZlBW9Dsux0vSduAKn/Gckw/miGDwOGrx+vMT9XfjhQPlFCj1/XKUQ0KO85x9v8Im7trVIFVmUc/bylNaa9KCeTjg6eE= root@BHS"
      key_name = "ssh-jenkins"
}

resource "aws_instance" "ec2" {
    ami = "ami-01dd271720c1ba44f"
    instance_type = "t2.micro"
    key_name = "ssh-jenkins"
    user_data = file("./script.sh")
    tags = {
        Name = "Web Scraper"
        }
}
output "ec2_public_ip" {
    value = aws_instance.ec2.public_ip
}