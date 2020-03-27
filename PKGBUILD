# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
pkgname=anbox-launchers-git
pkgver=r6.4b1d305
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
md5sums=('a6016bc3f447df98cf76ba0a68c98e0f'
         '0b7200e7a4201e64affea0cce2ad70f7'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
pkgver()
{
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
  pkgrel=$(git diff --shortstat|cut -d' ' -f2)
}
package() {
	make DESTDIR="$pkgdir/" SYSCONFDIR=/etc install
}
