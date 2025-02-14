# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit cmake desktop

DESCRIPTION="Infra Arcana is a Roguelike set in the early 20th century."
HOMEPAGE="https://sites.google.com/site/infraarcana/home"
SRC_URI="https://gitlab.com/martin-tornqvist/ia/-/archive/v22.1.0/ia-v22.1.0.tar.gz"
S=${WORKDIR}/ia-v22.1.0
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
DEPEND="dev-build/cmake sys-devel/gcc media-libs/libsdl2 dev-build/make media-libs/sdl2-mixer media-libs/sdl2-image"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"


src_configure() {
  local mycmakeargs=(
  -DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr"
  )
  cmake_src_configure
}

src_install() {
  default
  cmake_src_install
  cp "${FILESDIR}/ia.sh" "${D}/usr/ia/ia.sh" || die "Install failed"
  make_desktop_entry /usr/ia/ia.sh "Infra Arcana" Game
  dosym /usr/ia/ia.sh /usr/bin/ia
}
