# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="5"

USE_PHP="php5-3 php5-4 php5-5"

PHP_EXT_NAME="dmtx"
PHP_EXT_ZENDEXT="yes"

inherit eutils php-ext-source-r2 git-r3

DESCRIPTION="PHP bindings for the dmtx library"
HOMEPAGE="https://github.com/dmtx/php-dmtx"
SRC_URI=""

EGIT_REPO_URI="https://github.com/dmtx/php-dmtx.git"

LICENSE="PHP-3.01"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-lang/php media-libs/libdmtx"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch_user
	for slot in $(php_get_slots); do
		cp -r "${S}" "${WORKDIR}/${slot}"
	done
	php-ext-source-r2_src_prepare
}