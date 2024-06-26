# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Fast, disk space efficient package manager"
HOMEPAGE="https://pnpm.io"
SRC_URI="https://github.com/pnpm/pnpm/releases/download/v${PV}/pnpm-linux-x64 -> pnpm-bin-${PV}"

S="${WORKDIR}"
QA_PREBUILT="*"
RESTRICT="mirror strip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	dobin "${DISTDIR}/pnpm-bin-${PV}"
	dosym "${EPREFIX}/usr/bin/pnpm-bin-${PV}" "${EPREFIX}/usr/bin/pnpm"
}
