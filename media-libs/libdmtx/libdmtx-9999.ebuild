# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libdmtx/libdmtx-0.7.4.ebuild,v 1.7 2012/08/19 08:15:04 scarabeus Exp $

EAPI=4

inherit git-2

DESCRIPTION="Barcode data matrix reading and writing library"
HOMEPAGE="http://www.libdmtx.org/"
SRC_URI=""

EGIT_REPO_URI="git://libdmtx.git.sourceforge.net/gitroot/libdmtx/${PN}"
EGIT_BOOTSTRAP="./autogen.sh"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		$(use_enable static-libs static)
}

src_install() {
	default
	find "${ED}" -name '*.la' -exec rm -f {} +
}
