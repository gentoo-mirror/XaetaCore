# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit desktop

DESCRIPTION="Lampray is a mod manager for gaming on Linux!"
HOMEPAGE="https://github.com/CHollingworth/Lampray"
SRC_URI="https://github.com/CHollingworth/Lampray/archive/refs/tags/v1.3.2.tar.gz"
S="${WORKDIR}/Lampray-1.3.2"
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
DEPEND="media-libs/libsdl2 app-arch/7zip gnome-extra/zenity"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_compile() {
  ./build.sh
}
