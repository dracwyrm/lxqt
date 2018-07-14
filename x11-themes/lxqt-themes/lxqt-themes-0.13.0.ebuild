# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils eapi7-ver

DESCRIPTION="Themes, graphics and icons for LXQt"
HOMEPAGE="https://lxqt.org/"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/lxqt/${PN}.git"
else
	SRC_URI="https://downloads.lxqt.org/downloads/${PN}/${PV}/${P}.tar.xz"
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
fi

LICENSE="GPL-2+ LGPL-2.1+"
SLOT="0/$(ver_cut 1-2)"

RDEPEND="!lxqt-base/lxqt-common"
DEPEND="${RDEPEND}
	>=dev-util/lxqt-build-tools-0.5.0
"

mycmakeargs=( -DPULL_TRANSLATIONS=OFF )
