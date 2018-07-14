# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eapi7-ver

DESCRIPTION="Meta ebuild for LXQt, the Lightweight Desktop Environment"
HOMEPAGE="https://lxqt.org/"

if [[ ${PV} = *9999* ]]; then
	KEYWORDS="-*"
else
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
fi

LICENSE="metapackage"
SLOT="0/$(ver_cut 1-2)"

IUSE="+about admin +filemanager lightdm lximage minimal nls +policykit
	powermanagement processviewer screenshot sddm ssh-askpass
	sudo terminal"

# Note: we prefer kde-frameworks/oxygen-icons over other icon sets, as the initial
# install expects oxygen icons, until the user specifies otherwise (bug 543380)
RDEPEND="
	kde-frameworks/oxygen-icons
	lxqt-base/lxqt-config:${SLOT}
	lxqt-base/lxqt-globalkeys:${SLOT}
	lxqt-base/lxqt-notificationd:${SLOT}
	lxqt-base/lxqt-panel:${SLOT}
	lxqt-base/lxqt-qtplugin:${SLOT}
	lxqt-base/lxqt-runner:${SLOT}
	lxqt-base/lxqt-session:${SLOT}
	virtual/ttf-fonts
	x11-themes/lxqt-themes:${SLOT}
	about? ( lxqt-base/lxqt-about:${SLOT} )
	admin? ( lxqt-base/lxqt-admin:${SLOT} )
	filemanager? ( x11-misc/pcmanfm-qt:${SLOT} )
	lightdm? ( x11-misc/lightdm )
	lximage? ( media-gfx/lximage-qt )
	!minimal? (
		x11-wm/openbox
		x11-misc/obconf-qt
	)
	nls? ( lxqt-base/lxqt-l10n:${SLOT} )
	policykit? (
		lxqt-base/lxqt-policykit:${SLOT}
		|| (
			sys-auth/consolekit[policykit(-)]
			sys-apps/systemd[policykit(-)]
		)
	)
	powermanagement? ( lxqt-base/lxqt-powermanagement:${SLOT} )
	processviewer? ( x11-misc/qps:0 )
	screenshot? ( x11-misc/screengrab:0 )
	sddm? ( >=x11-misc/sddm-0.11.0 )
	ssh-askpass? ( lxqt-base/lxqt-openssh-askpass:${SLOT} )
	sudo? ( lxqt-base/lxqt-sudo:${SLOT} )
	terminal? ( x11-terms/qterminal:0 )
"

S="${WORKDIR}"
