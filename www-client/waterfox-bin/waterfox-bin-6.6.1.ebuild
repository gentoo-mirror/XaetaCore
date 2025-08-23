# @Author : XaetaCore
# Distributed under the terms of the GNU General Public License v2
EAPI=8

DESCRIPTION="
Fast and Private Web Browser"
HOMEPAGE="https://www.waterfox.net/"
SRC_URI="https://cdn1.waterfox.net/waterfox/releases/6.6.1/Linux_x86_64/waterfox-6.6.1.tar.bz2"
S="${WORKDIR}/waterfox"
LICENSE="MPL-2.0 LGPL-2.1+ LGPL-3.0+ Apache-2.0 \
         Apache-2.0-with-LLVM-exception BSD-2 BSD-3 \
         MIT ISC ZLIB Unicode-DFS-2016 Unlicense public-domain \
         ICU-67.1 V8-7.0 WebRTC-1.0 DirectXShaderCompiler-1.0 \
         nICEr"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_install() {
  mkdir -p ${D}/opt/waterfox || die "Failed to make opt dir for waterfox"
  cp -R "${S}/" "${D}/opt/" || die "Install failed!"
  dosym /opt/waterfox/waterfox /usr/bin/waterfox 
}