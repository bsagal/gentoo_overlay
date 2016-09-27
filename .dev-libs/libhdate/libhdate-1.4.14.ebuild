# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

#inherit eutils

DESCRIPTION="LibHdate is a small C,C++ library for the Hebrew calendar"
HOMEPAGE="http://libhdate.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64"

IUSE="utils python perl"

DEPEND=""
RDEPEND="${DEPEND}"