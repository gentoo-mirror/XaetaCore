# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit cmake

DESCRIPTION="Infra Arcana is a Roguelike set in the early 20th century."
HOMEPAGE="https://sites.google.com/site/infraarcana/home"
SRC_URI="https://gitlab.com/martin-tornqvist/ia/-/archive/v22.1.0/ia-v22.1.0.tar.gz"
S=${WORKDIR}/ia-v22.1.0
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
DEPEND="sys-devel/gcc dev-build/cmake dev-build/make media-libs/sdl2-mixer  media-libs/libsdl2 media-libs/sdl2-image"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_configure() {
  local mycmakeargs=(
    -DCMAKE_INSTALL_PREFIX=/usr/local/
  )
  cmake_src_configure
}
#src_install() {
#
#}

#src_compile() {
#  make ia
#}
