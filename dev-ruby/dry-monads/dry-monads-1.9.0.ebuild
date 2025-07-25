# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby32 ruby33 ruby34"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="dry-monads.gemspec"

inherit ruby-fakegem

DESCRIPTION="Common monads for Ruby"

HOMEPAGE="https://dry-rb.org/gems/dry-monads/"
SRC_URI="https://github.com/dry-rb/dry-monads/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="$(ver_cut 1)"
KEYWORDS="~amd64 ~arm64 ~hppa ~ppc ~ppc64 ~sparc ~x86"
IUSE="test"

ruby_add_rdepend "
	dev-ruby/concurrent-ruby:1
	>=dev-ruby/dry-core-1.1:1
	>=dev-ruby/zeitwerk-2.6:2
"

ruby_add_bdepend "test? (
	dev-ruby/dry-types
	dev-ruby/warning
)"

all_ruby_prepare() {
	# Avoid specs for unpackaged optional super_diff.
	rm -f spec/extensions/super_diff_spec.rb || die
}
