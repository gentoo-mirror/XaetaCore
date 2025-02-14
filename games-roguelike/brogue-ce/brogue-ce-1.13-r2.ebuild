# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit desktop

DESCRIPTION="A community fork of the much-loved minimalist roguelike game"
HOMEPAGE="https://sites.google.com/site/broguegame"
SRC_URI="https://github.com/tmewett/BrogueCE/archive/refs/tags/v1.13.tar.gz"
S=${WORKDIR}/BrogueCE-1.13
LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="amd64"
DEPEND="sys-devel/gcc sys-apps/diffutils media-libs/libsdl2 media-libs/sdl2-image"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_configure() {
  sed -i -e "s/DATADIR\ \:=\ ./DATADIR\ \:=\ \/opt\/brogue-ce\/bin/g" config.mk
}

src_install() {
  mkdir -p ${D}/opt/brogue-ce || die "Failed to make opt dir"
  cp -R "${S}/bin/" "${D}/opt/brogue-ce" || die "Install failed!"
  cp -R "${S}/linux/brogue-multiuser.sh" "${D}/opt/brogue-ce/bin" || die "Install failed!"
 sed -i -e "s/\/opt\/brogue/\/opt\/brogue-ce\/bin/g" ${D}/opt/brogue-ce/bin/brogue-multiuser.sh
  # Install desktop file and install start script
  newicon bin/assets/icon.png brogue-ce.png
  make_desktop_entry /opt/brogue-ce/bin/brogue-multiuser.sh "Brogue-CE" brogue-ce.png Game
  dosym /opt/brogue-ce/bin/brogue-multiuser.sh /usr/bin/brogue-ce
}
