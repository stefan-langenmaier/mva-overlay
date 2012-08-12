# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# ebuild generated by hackport 0.2.18.9999

CABAL_FEATURES="bin"
inherit eutils git-2 haskell-cabal

DESCRIPTION="manage files with git, without checking their contents into git"
HOMEPAGE="http://git-annex.branchable.com/"
SRC_URI=""
EGIT_REPO_URI="git://git.kitenet.net/git-annex"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"
RESTRICT=test # don't seem to like our git environment much

RDEPEND=">=dev-vcs/git-1.7.7" # TODO: add more deps?
DEPEND="${RDEPEND}
		test? ( dev-haskell/extensible-exceptions
			dev-haskell/hunit
			dev-haskell/testpack
		)
		dev-haskell/bloomfilter
		>=dev-haskell/cabal-1.8
		dev-haskell/dataenc
		dev-haskell/edit-distance
		dev-haskell/hs3
		dev-haskell/hslogger
		dev-haskell/http
		dev-haskell/ifelse
		dev-haskell/json
		dev-haskell/lifted-base
		dev-haskell/missingh
		dev-haskell/monad-control
		dev-haskell/mtl
		dev-haskell/network
		dev-haskell/pcre-light
		>=dev-haskell/quickcheck-2.1
		dev-haskell/sha
		dev-haskell/text
		dev-haskell/time
		dev-haskell/transformers-base
		dev-haskell/utf8-string
		>=dev-lang/ghc-6.12.3
		dev-lang/perl
		doc? ( www-apps/ikiwiki net-misc/rsync )"
# dev-lang/perl is to build the manpages
# www-apps/ikiwiki and net-misc/rsync used to build the rest of the docs

src_prepare() {
	epatch "${FILESDIR}"/${P}-no-tf.patch
	echo 'mans: $(mans)' >>"${S}"/Makefile
}

src_compile() {
	haskell-cabal_src_compile
	use doc && emake docs
	emake mans
}

src_test() {
	export GIT_CONFIG=${T}/temp-git-config
	git config user.email "git@src_test"
	git config user.name "Mr. ${P} The Test"

	emake test
}

src_install() {
	#haskell-cabal_src_install
	emake install DESTDIR="${D}" PREFIX="${EPREFIX}/usr"
	mv "${ED}"/usr/share/doc/{${PN},${PF}}
	dodoc CHANGELOG README
}