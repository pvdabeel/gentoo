# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} pypy3 pypy3_11 )

inherit distutils-r1 pypi

DESCRIPTION="Basic functions for handling mime-types in python"
HOMEPAGE="
	https://github.com/falconry/python-mimeparse/
	https://pypi.org/project/python-mimeparse/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~x64-macos"

python_test() {
	"${EPYTHON}" mimeparse_test.py -v || die "Tests fail with ${EPYTHON}"
}
