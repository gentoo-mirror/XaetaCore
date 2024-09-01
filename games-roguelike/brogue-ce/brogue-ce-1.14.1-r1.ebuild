# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit desktop

DESCRIPTION="A community fork of the much-loved minimalist roguelike game"
HOMEPAGE="https://sites.google.com/site/broguegame"
SRC_URI="https://github.com/tmewett/BrogueCE/archive/refs/tags/v1.14.1.tar.gz"
S=${WORKDIR}/BrogueCE-1.14.1
LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="tui +gui"
DEPEND="
  sys-devel/gcc
  sys-apps/diffutils
  gui? ( media-libs/libsdl2 media-libs/sdl2-image )
  tui? ( sys-libs/ncurses )"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"
REQUIRED_USE="^^ ( tui gui )"

src_prepare() {
  default
  sed -i \
    -e "s/^TERMINAL :=.*/TERMINAL := $(usex tui YES NO)/" \
    -e "s/^GRAPHICS :=.*/GRAPHICS := $(usex gui YES NO)/" \
    config.mk || die "Failed to set useflags in config.mk"
  sed -i -e "s/DATADIR\ \:=\ ./DATADIR\ \:=\ \/opt\/brogue-ce\/bin/g" config.mk
}

src_compile() {
  emake CC="cc" LDFLAGS="-lm -ltinfo" || die "emake failed"
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