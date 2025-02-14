# @Author : XaetaCore
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit desktop unpacker

DESCRIPTION="ProtonPass Free password manager with identity protection"
HOMEPAGE="https://proton.me/pass"
SRC_URI="https://proton.me/download/PassDesktop/linux/x64/ProtonPass.deb"
S=${WORKDIR}/proton-pass.ebuild
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
DEPEND=""
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
