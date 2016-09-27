# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qt4-r2 eutils

MY_PV=${PV/_p/ubuntu}
UBUNTU_DIST="saucy1"
DESCRIPTION="Reader for Orayta Jewish Book Collection"
HOMEPAGE="http://orayta.googlecode.com/"
SRC_URI="http://launchpad.net/~moshe-wagner/+archive/orayta/+files/${PN}_${MY_PV}~${UBUNTU_DIST}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-qt/qtgui-4.5:4
	>=dev-qt/qtxmlpatterns-4.5:4
	>=dev-qt/qtwebkit-4.5:4
	app-text/poppler[qt4]
	dev-libs/fribidi
	dev-libs/quazip
	sys-libs/zlib"
RDEPEND="${DEPEND}
	>=app-dicts/orayta-books-0.13"

S="${WORKDIR}/recipe-{debupstream}"

src_prepare() {
    epatch "${FILESDIR}"/${PV}-use-system-quazip.patch

	qt4-r2_src_prepare
}
