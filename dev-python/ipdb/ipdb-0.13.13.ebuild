# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 optfeature pypi

DESCRIPTION="IPython-enabled pdb"
HOMEPAGE="
	https://github.com/gotcha/ipdb/
	https://pypi.org/project/ipdb/
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 ~hppa ~ppc ppc64 ~riscv ~sparc x86"

RDEPEND="
	>=dev-python/ipython-7.17[${PYTHON_USEDEP}]
"

DOCS=( AUTHORS HISTORY.txt README.rst )

distutils_enable_tests unittest

pkg_postinst() {
	optfeature "pyproject.toml support" dev-python/tomli
}
