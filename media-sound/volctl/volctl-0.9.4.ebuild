# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Per-application volume control and OSD for Linux desktops."
HOMEPAGE="https://buzz.github.io/volctl/"

SRC_URI="https://github.com/buzz/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"

KEYWORDS="~amd64"

DISTUTILS_USE_SETUPTOOLS=bdepend
PYTHON_COMPAT=( python3_{10,11} )
inherit distutils-r1 gnome2-utils

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/pulsectl[${PYTHON_USEDEP}]
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	media-sound/pulseaudio
"
DEPEND="
	${RDEPEND}
	dev-libs/glib:2
"

pkg_postinst() {
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update
}
