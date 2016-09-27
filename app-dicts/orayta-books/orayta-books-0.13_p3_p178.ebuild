# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

TEMP_PV=${PV/_p/ubuntu}
MY_PV=${TEMP_PV/_p/+}
UBUNTU_DIST="saucy1"

DESCRIPTION="Jewish Book Collection for use with Orayta (app-text/orayta)"
HOMEPAGE="http://orayta.googlecode.com/"
SRC_URI="http://launchpad.net/~moshe-wagner/+archive/orayta/+files/${PN}_${MY_PV}~${UBUNTU_DIST}.tar.gz"

LICENSE="GPL-2 LGPL-2.1 LGPL-3 CC-BY-SA-NC-2.5
		CC-BY-SA-3.0 FDL-1.3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="!<app-text/orayta-0.13"

S="${WORKDIR}/recipe-{debupstream}+{revno}"

src_configure() {
	./GenMakeFile.sh
}

src_install() {
	emake DESTDIR="${D}" install
}
