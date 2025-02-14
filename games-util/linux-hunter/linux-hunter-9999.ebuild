# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit git-r3

DESCRIPTION="Prototype MH:W companion app for Linux, inspired by SmartHunter."
HOMEPAGE="https://github.com/Emanem/linux-hunter"
EGIT_REPO_URI="https://github.com/Emanem/${PN}.git"
S="${WORKDIR}/linux-hunter-9999"
LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"
DEPEND="sys-devel/gcc sys-libs/ncurses dev-build/make"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"
PATCHES=(
  "${FILESDIR}"/Makefile.patch
)

src_install() {
  into /usr/
  dobin "linux-hunter"
}
