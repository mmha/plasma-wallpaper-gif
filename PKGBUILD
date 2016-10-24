pkgname=plasma-gif
pkgver=0.1
pkgrel=1
pkgdesc="GIF Wallpapers for KDE plasma"
arch=('x86' 'x86_64' 'armv7h')
license=('boost')
makedepends=('cmake')
depends=('plasma-desktop')

build() {
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	make DESTDIR="$pkgdir" install
}