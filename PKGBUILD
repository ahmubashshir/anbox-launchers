# Maintainer: Your Name <youremail@domain.com>
pkgname=anbox-launchers-git
pkgver=r3.f0c85b8
pkgrel=1
pkgdesc="Add Anbox App Launchers to Anbox Category in Desktop Menu."
arch=('any')
url="https://github.com/ahmubashshir/anbox-launchers"
license=('GPL')
groups=()
depends=('anbox-git'
		 'systemd'
		 'python-xdg')
makedepends=('coreutils')
provides=('anbox-launchers')
conflicts=('anbox-launchers')
install=anbox-launchers.install
source=('anbox-android.directory'
		'anbox-android.menu'
		'anbox-launchers'
		'anbox-launchers.service'
		'anbox-launchers.timer'
		'Makefile')
validpgpkeys=()
pkgver()
{
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
package() {
	make DESTDIR="$pkgdir/" install
}
md5sums=('a6016bc3f447df98cf76ba0a68c98e0f'
         '0b7200e7a4201e64affea0cce2ad70f7'
         '483dfcab92259f43f127090b6b76e21b'
         '1369757939a8e289d2ea4593f21fc35c'
         '395d63bb52483a4ba9d4af55dcd15531'
         'b159e9c44202240d1d2c284048c76002')
