resource "aws_instance" "wireguard" {
  ami           = "ami-09bba7f9d4df930e6"
  instance_type = "t2.micro"
  key_name   = "wireguard"

tags = {
    Name = "wireguard"
  }
  user_data = <<EOF
#!/bin/bash
apt update
apt install wireguard -y
wg genkey | sudo tee /etc/wireguard/private.key
chmod go= /etc/wireguard/private.key
cat /etc/wireguard/private.key | wg pubkey | sudo tee /etc/wireguard/public.key
touch /etc/wireguard/wg0.conf
ufw allow 51820/udp
ufw allow OpenSSH
ufw allow 22/tcp
ufw disable
ufw enable
ufw status
systemctl enable wg-quick@wg0.service
systemctl start wg-quick@wg0.service

EOF
}
