#!/bin/bash

# Kullanıcı adını argüman olarak al
new_username=$1

# Kullanıcı adı boşsa veya eksikse hata ver
if [ -z "$new_username" ]; then
    echo "Hata: Kullanıcı adı belirtilmeli."
    exit 1
fi

# Kullanıcıyı oluştur
sudo useradd -m $new_username

# Rasgele bir şifre oluştur
password=$(openssl rand -base64 12)

# Şifreyi ayarla
echo "$new_username:$password" | sudo chpasswd

# Kullanıcıya şifresini bildir
echo "Yeni kullanıcı oluşturuldu:"
echo "Kullanıcı adı: $new_username"
echo "Şifre: $password"