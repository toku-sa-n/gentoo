# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson multilib-minimal

DESCRIPTION="Deprecated Xlib integration for GdkPixbuf"
HOMEPAGE="https://gitlab.gnome.org/Archive/gdk-pixbuf-xlib"
SRC_URI="https://gitlab.gnome.org/Archive/${PN}/-/archive/${PV}/${P}.tar.bz2"
LICENSE="LGPL-2.1"
SLOT="0"

KEYWORDS="~amd64 ~x86"
IUSE="gtk-doc"

RDEPEND="
	dev-libs/glib:2[${MULTILIB_USEDEP}]
	>=x11-libs/gdk-pixbuf-2.42.0[${MULTILIB_USEDEP}]
	x11-libs/libX11[${MULTILIB_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
	gtk-doc? (
		app-text/docbook-xml-dtd:4.3
		>=dev-util/gtk-doc-1.20
	)
"

multilib_src_configure() {
	local emesonargs=(
		-Dgtk-doc="$(multilib_native_usex gtk-doc true false)"
	)
	meson_src_configure
}

multilib_src_compile() {
	meson_src_compile
}

multilib_src_install() {
	meson_src_install
}