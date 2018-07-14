# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils eapi7-ver

DESCRIPTION="LXQT session manager"
HOMEPAGE="https://lxqt.org/"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/lxqt/${PN}.git"
else
	SRC_URI="https://downloads.lxqt.org/downloads/${PN}/${PV}/${P}.tar.xz"
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
fi

IUSE="+themes"

LICENSE="GPL-2+ LGPL-2.1+"
SLOT="0/$(ver_cut 1-2)"

RDEPEND="
	dev-libs/libqtxdg:0/3
	dev-qt/qtcore:5=
	dev-qt/qtdbus:5=
	dev-qt/qtgui:5=
	dev-qt/qtwidgets:5=
	dev-qt/qtx11extras:5=
	dev-qt/qtxml:5=
	kde-frameworks/kwindowsystem:5=[X]
	lxqt-base/liblxqt:${SLOT}
	x11-libs/libX11
	x11-misc/xdg-user-dirs
	themes? ( x11-themes/lxqt-themes:${SLOT} )
	!lxqt-base/lxqt-common
"
DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5
	>=dev-util/lxqt-build-tools-0.5.0
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig
"

mycmakeargs=( -DPULL_TRANSLATIONS=OFF )

src_install(){
	cmake-utils_src_install
	doman lxqt-config-session/man/*.1 lxqt-session/man/*.1
}
