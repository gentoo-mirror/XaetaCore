# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A community fork of the much-loved minimalist roguelike game"
HOMEPAGE="https://sites.google.com/site/broguegame"
SRC_URI="https://github.com/tmewett/BrogueCE/archive/refs/tags/v1.13.tar.gz"
S=${WORKDIR}/BrogueCE-1.13
LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"
DEPEND="sys-devel/gcc sys-apps/diffutils media-libs/libsdl2 media-libs/sdl2-image"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"
#D="/opt/brogue-ce"

src_install() {
  mkdir -p ${D}/opt/brogue-ce || die "Failed to make opt dir"
  cp -R "${S}/bin/" "${D}/opt/brogue-ce" || die "Install failed!"
}
