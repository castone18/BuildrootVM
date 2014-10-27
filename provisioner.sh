#!/bin/bash
# +----------------------------------------------------------------------------
# | 
# |   Copyright (c) 2014 Christopher Stone
# |   Licensed under GPL v2.0, see LICENSE file.
# | 
# |   THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED
# |   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# |   MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# |   DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
# |   FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# |   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# |   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# |   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# |   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# |   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# |   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# | 
# +----------------------------------------------------------------------------
# |
# | provisioner.sh
# |
# |    Vagrant invoked provisioner of BuildrootVM. Modify this file to 
# | add provisioning such as installing additional packages.
# |
# +----------------------------------------------------------------------------

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

/bin/su tc -c "git clone http://git.buildroot.net/git/buildroot.git"

echo "Provisioning done."
