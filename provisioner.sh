#!/bin/bash

echo "Provisioning BuildrootVM..."

cd /home/tc

/bin/su tc -c "/usr/bin/tce-load -wi compiletc"
/bin/su tc -c "/usr/bin/tce-load -wi git"
/bin/su tc -c "/usr/bin/tce-load -wi svn"
/bin/su tc -c "/usr/bin/tce-load -wi wget"
/bin/su tc -c "/usr/bin/tce-load -wi ncurses-dev"
/bin/su tc -c "/usr/bin/tce-load -wi ncurses-utils"
/bin/su tc -c "/usr/bin/tce-load -wi perl5"
/bin/su tc -c "/usr/bin/tce-load -wi tar"
/bin/su tc -c "/usr/bin/tce-load -wi rsync"
/bin/su tc -c "/usr/bin/tce-load -wi python"
/bin/su tc -c "/usr/bin/tce-load -wi bc"
/bin/su tc -c "/usr/bin/tce-load -wi mktemp"
/bin/su tc -c "/usr/bin/tce-load -wi openjdk-7-jre"
/bin/su tc -c "/usr/bin/tce-load -wi openvpn"
/bin/su tc -c "/usr/bin/tce-load -wi samba3"
cp /vagrant/smb.conf /usr/local/etc/samba/smb.conf
cp /vagrant/vpn_static.key /mnt/sda2/tce/vpn_static.key
cp /vagrant/vpn_server.ovpn /mnt/sda2/tce/vpn_server.ovpn
/usr/local/etc/init.d/samba start
echo -e "vagrant\nvagrant" | smbpasswd -s -a tc
/usr/local/sbin/openvpn --config /mnt/sda2/tce/vpn_server.ovpn
cat >>/opt/bootlocal.sh <<EOF
/usr/local/sbin/openvpn --config /mnt/sda2/tce/vpn_server.ovpn
/usr/local/etc/init.d/samba start
EOF
cat >>/opt/.filetool.lst <<EOF
/usr/local/etc/samba/smb.conf
/usr/local/etc/samba/private/passdb.tdb
/usr/local/etc/samba/private/secrets.tdb
EOF
/bin/su tc -c "echo 'y' | backup"

#/bin/su tc -c "git clone http://git.buildroot.net/git/buildroot.git"

echo "Provisioning done."
