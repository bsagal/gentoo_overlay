# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/media-player-info/media-player-info-21-r1.ebuild,v 1.9 2015/04/08 07:30:32 mgorny Exp $

EAPI=5

DEB_EXTRA='-2'

inherit eutils unpacker

DESCRIPTION="A repository of data files describing media player capabilities"
HOMEPAGE="http://cgit.freedesktop.org/media-player-info/"
SRC_URI="mirror://debian/pool/main/m/${PN}/${PN}_${PV}${DEB_EXTRA}_all.deb"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ppc ppc64 ~sh ~sparc x86"
IUSE=""

# http://cgit.freedesktop.org/media-player-info/commit/?id=d83dd01a0a1df6198ee08954da1c033b88a1004b
RDEPEND=">=virtual/udev-208"
DEPEND="${RDEPEND}
	kernel_AIX? ( app-arch/deb2targz )"

# This ebuild does not install any binaries
RESTRICT="binchecks strip"

S=${WORKDIR}

src_install() {
	cp -pPR ${WORKDIR}/* "${D}"/ || die
	mv "${D}"/usr/share/doc/${PN} "${D}"/usr/share/doc/${P} || die
}

pkg_postinst() {
	# Run for /lib/udev/hwdb.d/20-usb-media-players.hwdb
	udevadm hwdb --update --root="${ROOT%/}"
	# http://cgit.freedesktop.org/systemd/systemd/commit/?id=1fab57c209035f7e66198343074e9cee06718bda
	if [[ ${ROOT} != "" ]] && [[ ${ROOT} != "/" ]]; then
		return 0
	fi
	udevadm control --reload
}
