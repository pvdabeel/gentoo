# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR="doc/reference"
RUBY_FAKEGEM_EXTRADOC="ChangeLog README.rdoc doc/text/news.md"

RUBY_FAKEGEM_TASK_TEST="test"

RUBY_FAKEGEM_GEMSPEC="locale.gemspec"

inherit ruby-fakegem

DESCRIPTION="A pure ruby library which provides basic APIs for localization"
HOMEPAGE="https://github.com/ruby-gettext/locale"
SRC_URI="https://github.com/ruby-gettext/locale/archive/${PV}.tar.gz -> ${P}-git.tgz"
LICENSE="|| ( Ruby-BSD GPL-2 )"

SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ppc ppc64 ~riscv sparc x86"
IUSE="test"

ruby_add_bdepend "doc? ( dev-ruby/yard )"

ruby_add_bdepend "test? ( dev-ruby/test-unit:2 dev-ruby/test-unit-rr )"

all_ruby_prepare() {
	sed -i -e '/notify/ s:^:#:' test/run-test.rb || die
}

all_ruby_compile() {
	all_fakegem_compile

	if use doc ; then
		yard || die
	fi
}

each_ruby_test() {
	${RUBY} test/run-test.rb || die
}

all_ruby_install() {
	all_fakegem_install

	dodoc -r samples
}
