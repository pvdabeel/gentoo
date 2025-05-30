# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

XORG_DOC=doc
XORG_MULTILIB=yes
inherit xorg-3

DESCRIPTION="X.Org Xmu library"
KEYWORDS="~alpha amd64 arm arm64 hppa ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=x11-libs/libX11-1.6.2[${MULTILIB_USEDEP}]
	>=x11-libs/libXext-1.3.2[${MULTILIB_USEDEP}]
	>=x11-libs/libXt-1.1.4[${MULTILIB_USEDEP}]
"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
	test? ( dev-libs/glib[${MULTILIB_USEDEP}] )
"

src_configure() {
	local XORG_CONFIGURE_OPTIONS=(
		$(use_enable doc docs)
		$(use_with doc xmlto)
		--without-fop
	)
	xorg-3_src_configure
}
