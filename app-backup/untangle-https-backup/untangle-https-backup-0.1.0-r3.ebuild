# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_10 python3_11 python3_12 python3_13 )
PYTHON_REQ_USE="ssl(+)"
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Back up Untangle configurations via the web admin UI"
HOMEPAGE="https://michael.orlitzky.com/code/untangle-https-backup.xhtml"
SRC_URI="https://michael.orlitzky.com/code/releases/${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 ~riscv x86"

src_install() {
	distutils-r1_src_install
	doman "doc/man8/${PN}.8"
	dodoc "doc/${PN}.example.ini"
}
