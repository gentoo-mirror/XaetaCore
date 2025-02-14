# @Author : XaetaCore
# Distributed under the terms of the GNU General Public License v2
EAPI=8
inherit desktop unpacker

DESCRIPTION="ProtonPass Free password manager with identity protection"
HOMEPAGE="https://proton.me/pass"
SRC_URI="https://proton.me/download/PassDesktop/linux/x64/ProtonPass.deb"
S="${WORKDIR}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
DEPEND="    x11-libs/gtk+:3
    x11-libs/libnotify
    dev-libs/nss
    x11-libs/libXtst
    x11-misc/xdg-utils
    app-accessibility/at-spi2-core
    x11-libs/libdrm
    media-libs/libgbm
    x11-libs/libxcb
    kde-cli-tools || kde-apps/kde-runtime || sys-apps/trash-cli || dev-libs/glib:2 || gnome-base/gvfs"
RDEPEND="${DEPEND}"

# Unpack the debian package
src_unpack() {
  unpack ${A}
}

src_install() {
  # Install extracted files
  cp -r "{$WORKDIR}/usr" "${D}"

  # Fix permissions
  chmod -R 755 "${D}/usr"
}