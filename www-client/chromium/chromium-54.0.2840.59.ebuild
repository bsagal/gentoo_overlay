# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"
PYTHON_COMPAT=( python2_7 )

CHROMIUM_LANGS="am ar bg bn ca cs da de el en-GB es es-419 et fa fi fil fr gu he
	hi hr hu id it ja kn ko lt lv ml mr ms nb nl pl pt-BR pt-PT ro ru sk sl sr
	sv sw ta te th tr uk vi zh-CN zh-TW"

inherit check-reqs chromium-2 eutils gnome2-utils flag-o-matic multilib multiprocessing pax-utils portability python-any-r1 readme.gentoo-r1 toolchain-funcs versionator virtualx xdg-utils

DESCRIPTION="Open-source version of Google Chrome web browser"
HOMEPAGE="http://chromium.org/"
SRC_URI="https://commondatastorage.googleapis.com/chromium-browser-official/${P}.tar.xz
nacl? (
	https://storage.googleapis.com/nativeclient-archive2/builds/11953a35fcd4f999b097a343bc49d89f94af21a8/linux_x86/nacl_x86_newlib.json -> nacl_x86_newlib_11953a35fcd4f999b097a343bc49d89f94af21a8.json
	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib.json -> pnacl_newlib_25a7ef81d2dc76b58450fa2d5f97070eafa20164.json
	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/shared/pnacl_translator.json -> pnacl_translator_25a7ef81d2dc76b58450fa2d5f97070eafa20164.json

	https://storage.googleapis.com/nativeclient-archive2/builds/11953a35fcd4f999b097a343bc49d89f94af21a8/linux_x86/nacl_x86_newlib/core_sdk.tgz.json -> core_sdk_11953a35fcd4f999b097a343bc49d89f94af21a8.tgz.json
	https://storage.googleapis.com/nativeclient-archive2/toolchain/11953a35fcd4f999b097a343bc49d89f94af21a8/core_sdk_linux_x86.tgz -> core_sdk_11953a35fcd4f999b097a343bc49d89f94af21a8.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/11953a35fcd4f999b097a343bc49d89f94af21a8/linux_x86/nacl_x86_newlib/gdb_i686_linux.tgz.json -> gdb_i686_linux_a9a003c04d06a2ee9f3fbb6223ee31510543bb72.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/gdb_i686_linux_a9a003c04d06a2ee9f3fbb6223ee31510543bb72.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/11953a35fcd4f999b097a343bc49d89f94af21a8/linux_x86/nacl_x86_newlib/naclsdk.tgz.json -> naclsdk_11953a35fcd4f999b097a343bc49d89f94af21a8.tgz.json
	https://storage.googleapis.com/nativeclient-archive2/toolchain/11953a35fcd4f999b097a343bc49d89f94af21a8/naclsdk_linux_x86.tgz -> naclsdk_11953a35fcd4f999b097a343bc49d89f94af21a8.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/binutils_x86_64_linux.tgz.json -> binutils_x86_64_linux_8ccf4b8a74c844a041d2ad5d15e3999157eeffaf.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/binutils_x86_64_linux_8ccf4b8a74c844a041d2ad5d15e3999157eeffaf.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/binutils_x86_x86_64_linux.tgz.json -> binutils_x86_x86_64_linux_48782a43a8af3479f0fe0a7aaace7d072aeb988f.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/binutils_x86_x86_64_linux_48782a43a8af3479f0fe0a7aaace7d072aeb988f.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/compiler_rt_bc_i686_bc.tgz.json -> compiler_rt_bc_i686_bc_71090b27cd8b1715e837612db7bb6ae9884eb9b2.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/compiler_rt_bc_i686_bc_71090b27cd8b1715e837612db7bb6ae9884eb9b2.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/compiler_rt_bc_le32.tgz.json -> compiler_rt_bc_le32_8ffbdf3186f342d7bfbac5d6d213d30d906ce0c8.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/compiler_rt_bc_le32_8ffbdf3186f342d7bfbac5d6d213d30d906ce0c8.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/compiler_rt_bc_x86_64_bc.tgz.json -> compiler_rt_bc_x86_64_bc_835c0d337b0862daabf5f1c90c90acb70250d078.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/compiler_rt_bc_x86_64_bc_835c0d337b0862daabf5f1c90c90acb70250d078.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/core_sdk_libs_i686.tgz.json -> core_sdk_libs_i686_da4ae62443144b77a31a9e995d48725d93d649ed.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/core_sdk_libs_i686_da4ae62443144b77a31a9e995d48725d93d649ed.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/core_sdk_libs_le32.tgz.json -> core_sdk_libs_le32_ec7a6d86bc8b03a7dba36f4ec5b20688866101e9.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/core_sdk_libs_le32_ec7a6d86bc8b03a7dba36f4ec5b20688866101e9.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/core_sdk_libs_x86_64.tgz.json -> core_sdk_libs_x86_64_16084d5bbd51b0c52d475d669675f6c57474abac.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/core_sdk_libs_x86_64_16084d5bbd51b0c52d475d669675f6c57474abac.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/driver_x86_64_linux.tgz.json -> driver_x86_64_linux_aebe5000b2daaa6ca9fff580835fa5d5948fdebc.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/driver_x86_64_linux_aebe5000b2daaa6ca9fff580835fa5d5948fdebc.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libcxx_i686.tgz.json -> libcxx_i686_ba67ebc8ed4865c85d28ac3189e36a492fd5906a.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libcxx_i686_ba67ebc8ed4865c85d28ac3189e36a492fd5906a.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libcxx_i686_bc.tgz.json -> libcxx_i686_bc_2ec9472750ffb4ff9714cfa5c17c933f08f63e9a.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libcxx_i686_bc_2ec9472750ffb4ff9714cfa5c17c933f08f63e9a.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libcxx_le32.tgz.json -> libcxx_le32_cd7894ffc6dd897b9549ed5930c4e46cec037de3.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libcxx_le32_cd7894ffc6dd897b9549ed5930c4e46cec037de3.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libcxx_x86_64.tgz.json -> libcxx_x86_64_54d64049fb92ed08573101943a02a52d0d3fda90.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libcxx_x86_64_54d64049fb92ed08573101943a02a52d0d3fda90.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libcxx_x86_64_bc.tgz.json -> libcxx_x86_64_bc_cf9a7da4e44786685120a521f6fbbcece2ea177f.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libcxx_x86_64_bc_cf9a7da4e44786685120a521f6fbbcece2ea177f.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libcxx_x86_64_linux.tgz.json -> libcxx_x86_64_linux_232c2b1151bad4df41fe89551f32e5f81ebc716f.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libcxx_x86_64_linux_232c2b1151bad4df41fe89551f32e5f81ebc716f.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libgcc_eh_x86_32.tgz.json -> libgcc_eh_x86_32_6dc8bbe08474537602c66fd6db3024b812d91448.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libgcc_eh_x86_32_6dc8bbe08474537602c66fd6db3024b812d91448.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libgcc_eh_x86_64.tgz.json -> libgcc_eh_x86_64_729cfb07fe284ff8deb43d30467ab31a3ae17edd.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libgcc_eh_x86_64_729cfb07fe284ff8deb43d30467ab31a3ae17edd.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libs_support_i686.tgz.json -> libs_support_i686_97b91213450f99f7562375aa934779ba98b5d598.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libs_support_i686_97b91213450f99f7562375aa934779ba98b5d598.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libs_support_i686_bc.tgz.json -> libs_support_i686_bc_a270af9146913a4c0d922f0380a21e61e09e5ea8.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libs_support_i686_bc_a270af9146913a4c0d922f0380a21e61e09e5ea8.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libs_support_le32.tgz.json -> libs_support_le32_ebaf6761a9ba9d5c3f2693b78efd5988763a712c.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libs_support_le32_ebaf6761a9ba9d5c3f2693b78efd5988763a712c.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libs_support_translator_x86_32.tgz.json -> libs_support_translator_x86_32_270be6a605f07e051e645d1af63fe2dd7b32543a.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libs_support_translator_x86_32_270be6a605f07e051e645d1af63fe2dd7b32543a.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libs_support_translator_x86_32_nonsfi.tgz.json -> libs_support_translator_x86_32_nonsfi_0d890fe58714973398681c3cd82c0d1e2ac5521b.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libs_support_translator_x86_32_nonsfi_0d890fe58714973398681c3cd82c0d1e2ac5521b.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libs_support_translator_x86_64.tgz.json -> libs_support_translator_x86_64_ae6ca014ebc54ae04f398324eff54f2492330c3f.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libs_support_translator_x86_64_ae6ca014ebc54ae04f398324eff54f2492330c3f.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libs_support_x86_64.tgz.json -> libs_support_x86_64_2c339a4b13ae5a3bc6dce14f78a9ed405960fce7.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libs_support_x86_64_2c339a4b13ae5a3bc6dce14f78a9ed405960fce7.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/libs_support_x86_64_bc.tgz.json -> libs_support_x86_64_bc_96a311b617562f6035ddebddcfa8ef57955f4d63.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/libs_support_x86_64_bc_96a311b617562f6035ddebddcfa8ef57955f4d63.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/llvm_x86_64_linux.tgz.json -> llvm_x86_64_linux_4714c5a92e796beda585a7aa080069cdd3d4f4eb.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/llvm_x86_64_linux_4714c5a92e796beda585a7aa080069cdd3d4f4eb.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/metadata.tgz.json -> metadata_3e42a7875fe3db05f30ceb7132008b530a60e429.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/metadata_3e42a7875fe3db05f30ceb7132008b530a60e429.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/newlib_i686.tgz.json -> newlib_i686_bc57b675ba76cde66ad58810c2fb64fbbc888b50.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/newlib_i686_bc57b675ba76cde66ad58810c2fb64fbbc888b50.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/newlib_i686_bc.tgz.json -> newlib_i686_bc_665d891237ad05188343e99663ae22d6af07378b.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/newlib_i686_bc_665d891237ad05188343e99663ae22d6af07378b.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/newlib_le32.tgz.json -> newlib_le32_c6642a55a464c9ee71b8c38117dccb83781a8db6.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/newlib_le32_c6642a55a464c9ee71b8c38117dccb83781a8db6.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/newlib_x86_64.tgz.json -> newlib_x86_64_4d77590618780ad27f9d02be457cf5d402fea69a.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/newlib_x86_64_4d77590618780ad27f9d02be457cf5d402fea69a.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/newlib_x86_64_bc.tgz.json -> newlib_x86_64_bc_a90b5589e73df4fac7557f083e82c3f9a0d4da2e.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/newlib_x86_64_bc_a90b5589e73df4fac7557f083e82c3f9a0d4da2e.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/unsandboxed_runtime_x86_32_linux.tgz.json -> unsandboxed_runtime_x86_32_linux_ec43cb9a60d17bb73aa07c41cc69cf6713820357.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/unsandboxed_runtime_x86_32_linux_ec43cb9a60d17bb73aa07c41cc69cf6713820357.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/linux_x86/pnacl_newlib/unsandboxed_runtime_x86_64_linux.tgz.json -> unsandboxed_runtime_x86_64_linux_39cd59ce6be14ee949c9f430947bd393fb6182e8.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/unsandboxed_runtime_x86_64_linux_39cd59ce6be14ee949c9f430947bd393fb6182e8.tgz

	https://storage.googleapis.com/nativeclient-archive2/builds/25a7ef81d2dc76b58450fa2d5f97070eafa20164/shared/pnacl_translator/sandboxed_translators.tgz.json -> sandboxed_translators_588542cc5272b1ef528750e378e7a2afbc8f3fff.tgz.json
	https://storage.googleapis.com/nativeclient-once/object/sandboxed_translators_588542cc5272b1ef528750e378e7a2afbc8f3fff.tgz
)"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 x86"
IUSE="cups +gn gnome gnome-keyring gtk3 +hangouts kerberos nacl neon pic +proprietary-codecs pulseaudio selinux +suid +system-ffmpeg +tcmalloc widevine"
RESTRICT="!system-ffmpeg? ( proprietary-codecs? ( bindist ) ) arm? ( !nacl ) arm64? ( !nacl )"

# Native Client binaries are compiled with different set of flags, bug #452066.
QA_FLAGS_IGNORED=".*\.nexe"

# Native Client binaries may be stripped by the build system, which uses the
# right tools for it, bug #469144 .
QA_PRESTRIPPED=".*\.nexe"

COMMON_DEPEND="
	app-arch/bzip2:=
	cups? ( >=net-print/cups-1.3.11:= )
	>=dev-libs/elfutils-0.149
	dev-libs/expat:=
	dev-libs/glib:=
	>=dev-libs/jsoncpp-0.5.0-r1:=
	dev-libs/nspr:=
	>=dev-libs/nss-3.14.3:=
	>=dev-libs/re2-0.2016.05.01:=
	gnome? ( >=gnome-base/gconf-2.24.0:= )
	gnome-keyring? ( >=gnome-base/libgnome-keyring-3.12:= )
	>=media-libs/alsa-lib-1.0.19:=
	media-libs/fontconfig:=
	media-libs/freetype:=
	media-libs/libexif:=
	media-libs/libjpeg-turbo:=
	media-libs/libpng:=
	media-libs/libvpx:=[svc]
	media-libs/speex:=
	pulseaudio? ( media-sound/pulseaudio:= )
	system-ffmpeg? ( >=media-video/ffmpeg-2.7.2:= )
	sys-apps/dbus:=
	sys-apps/pciutils:=
	>=sys-libs/libcap-2.22:=
	virtual/udev
	x11-libs/cairo:=
	x11-libs/gdk-pixbuf:=
	gtk3? ( x11-libs/gtk+:3= )
	!gtk3? ( x11-libs/gtk+:2= )
	x11-libs/libdrm
	x11-libs/libX11:=
	x11-libs/libXcomposite:=
	x11-libs/libXcursor:=
	x11-libs/libXdamage:=
	x11-libs/libXext:=
	x11-libs/libXfixes:=
	>=x11-libs/libXi-1.6.0:=
	x11-libs/libXinerama:=
	x11-libs/libXrandr:=
	x11-libs/libXrender:=
	x11-libs/libXScrnSaver:=
	x11-libs/libXtst:=
	x11-libs/pango:=
	app-arch/snappy:=
	dev-libs/libxml2:=[icu]
	dev-libs/libxslt:=
	media-libs/flac:=
	>=media-libs/harfbuzz-0.9.41:=[icu(+)]
	>=media-libs/libwebp-0.4.0:=
	sys-libs/zlib:=[minizip]
	kerberos? ( virtual/krb5 )
	!gn? (
		>=app-accessibility/speech-dispatcher-0.8:=
		>=dev-libs/libevent-1.4.13:=
	)
"
# For nvidia-drivers blocker, see bug #413637 .
RDEPEND="${COMMON_DEPEND}
	!=www-client/chromium-9999
	!<www-plugins/chrome-binary-plugins-37
	x11-misc/xdg-utils
	virtual/opengl
	virtual/ttf-fonts
	selinux? ( sec-policy/selinux-chromium )
	tcmalloc? ( !<x11-drivers/nvidia-drivers-331.20 )
	widevine? ( www-plugins/chrome-binary-plugins[widevine(-)] )
"
# dev-vcs/git - https://bugs.gentoo.org/593476
DEPEND="${COMMON_DEPEND}
	>=app-arch/gzip-1.7
	!arm? (
		dev-lang/yasm
	)
	dev-lang/perl
	dev-perl/JSON
	>=dev-util/gperf-3.0.3
	dev-util/ninja
	sys-apps/hwids[usb(+)]
	>=sys-devel/bison-2.4.3
	sys-devel/flex
	virtual/pkgconfig
	dev-vcs/git
	$(python_gen_any_dep '
		dev-python/beautifulsoup:python-2[${PYTHON_USEDEP}]
		>=dev-python/beautifulsoup-4.3.2:4[${PYTHON_USEDEP}]
		dev-python/html5lib[${PYTHON_USEDEP}]
		dev-python/jinja[${PYTHON_USEDEP}]
		dev-python/ply[${PYTHON_USEDEP}]
		dev-python/simplejson[${PYTHON_USEDEP}]
	')
"

# Keep this in sync with the python_gen_any_dep call.
python_check_deps() {
	has_version --host-root "dev-python/beautifulsoup:python-2[${PYTHON_USEDEP}]" &&
	has_version --host-root ">=dev-python/beautifulsoup-4.3.2:4[${PYTHON_USEDEP}]" &&
	has_version --host-root "dev-python/html5lib[${PYTHON_USEDEP}]" &&
	has_version --host-root "dev-python/jinja[${PYTHON_USEDEP}]" &&
	has_version --host-root "dev-python/ply[${PYTHON_USEDEP}]" &&
	has_version --host-root "dev-python/simplejson[${PYTHON_USEDEP}]"
}

if ! has chromium_pkg_die ${EBUILD_DEATH_HOOKS}; then
	EBUILD_DEATH_HOOKS+=" chromium_pkg_die";
fi

DISABLE_AUTOFORMATTING="yes"
DOC_CONTENTS="
Some web pages may require additional fonts to display properly.
Try installing some of the following packages if some characters
are not displayed properly:
- media-fonts/arphicfonts
- media-fonts/bitstream-cyberbit
- media-fonts/droid
- media-fonts/ipamonafont
- media-fonts/noto
- media-fonts/ja-ipafonts
- media-fonts/takao-fonts
- media-fonts/wqy-microhei
- media-fonts/wqy-zenhei

Depending on your desktop environment, you may need
to install additional packages to get icons on the Downloads page.

For KDE, the required package is kde-frameworks/oxygen-icons.

For other desktop environments, try one of the following:
- x11-themes/gnome-icon-theme
- x11-themes/tango-icon-theme
"

PATCHES=(
	"${FILESDIR}/${PN}-system-ffmpeg-r3.patch"
	"${FILESDIR}/${PN}-system-jinja-r13.patch"
	"${FILESDIR}/${PN}-widevine-r1.patch"
	"${FILESDIR}/chromium-54-ffmpeg2compat.patch"
	"${FILESDIR}/${PN}-gn-bootstrap-ld.patch"
	"${FILESDIR}/${PN}-gn-nacl.patch"
)

pkg_pretend() {
	if [[ ${MERGE_TYPE} != binary ]]; then
		if tc-is-gcc && ! version_is_at_least 4.8 "$(gcc-version)"; then
			die 'At least gcc 4.8 is required, see bugs: #535730, #525374, #518668.'
		fi
	fi

	# Check build requirements, bug #541816 and bug #471810 .
	CHECKREQS_MEMORY="3G"
	CHECKREQS_DISK_BUILD="5G"
	eshopts_push -s extglob
	if is-flagq '-g?(gdb)?([1-9])'; then
		CHECKREQS_DISK_BUILD="25G"
	fi
	eshopts_pop
	check-reqs_pkg_pretend
}

pkg_setup() {
	# Make sure the build system will use the right python, bug #344367.
	python-any-r1_pkg_setup

	chromium_suid_sandbox_check_kernel_config
}

src_unpack() {
	unpack ${P}.tar.xz

	if use nacl; then
		local toolchains
		# for NaCL we have to place toolchain JSON metadata files into appropriate place
		# so download_nacl_toolchains.py can find and use them for archives extraction
		for jsonfile in $DISTDIR/*.json; do
			case $jsonfile in
				*.tgz.json) ;; # Skip per-package metadata

				*.json) # create symlinks and directories for toolchain metadata JSON files
					jsonfile=${jsonfile##*/}
					local toolchain=${jsonfile%_*}
					toolchains="${toolchains} ${toolchain}"

					mkdir -p ${S}/native_client/toolchain/.tars/linux_x86/${toolchain} &&
					ln -s ${DISTDIR}/${jsonfile} ${S}/native_client/toolchain/.tars/linux_x86/${toolchain}.json ||
					die
				;;
			esac
		done

		for jsonfile in ${DISTDIR}/*.tgz.json; do
			# getting package hash from JSON file to use it as a destination tar name
			local tgzhash
			tgzhash=$( grep '"hash"' $jsonfile ) || die
			tgzhash=${tgzhash%\"*}
			tgzhash=${tgzhash##*\"}
			# stripping path components from JSON file
			jsonfile=${jsonfile##*/}
			# original tar archive name
			local distfile=${jsonfile%.json}
			# tar archive name without revision hash
			local tgzname=${distfile%_*.tgz}.tgz
			# checking toolchain name this package belongs to
			local jsondest
			jsondest=$( grep -l "$tgzname" ${S}/native_client/toolchain/.tars/linux_x86/*.json ) || die
			jsondest=${jsondest%.json}
			jsondest=${jsondest##*/}
			# placing everything into appropriate places
			mkdir -p ${S}/native_client/toolchain/.tars/package_archives/${tgzname} &&
			ln -s ${DISTDIR}/${distfile} ${S}/native_client/toolchain/.tars/package_archives/${tgzname}/${tgzhash}.tgz &&
			ln -s ${DISTDIR}/${jsonfile} ${S}/native_client/toolchain/.tars/linux_x86/${jsondest}/${tgzname}.json ||
			die
		done

		# Use download_nacl_toolchains.py to extract archives
		cd $S || die
		for toolchain in $toolchains; do
			python build/download_nacl_toolchains.py --packages $toolchain extract --skip-missing || die
		done
		cd $WORKDIR || die
	fi
}

src_prepare() {
	default

	local keeplibs=(
		base/third_party/dmg_fp
		base/third_party/dynamic_annotations
		base/third_party/icu
		base/third_party/nspr
		base/third_party/superfasthash
		base/third_party/symbolize
		base/third_party/valgrind
		base/third_party/xdg_mime
		base/third_party/xdg_user_dirs
		breakpad/src/third_party/curl
		chrome/third_party/mozilla_security_manager
		courgette/third_party
		net/third_party/mozilla_security_manager
		net/third_party/nss
		third_party/WebKit
		third_party/analytics
		third_party/angle
		third_party/angle/src/common/third_party/numerics
		third_party/angle/src/third_party/compiler
		third_party/angle/src/third_party/libXNVCtrl
		third_party/angle/src/third_party/murmurhash
		third_party/angle/src/third_party/trace_event
		third_party/boringssl
		third_party/brotli
		third_party/cacheinvalidation
		third_party/catapult
		third_party/catapult/third_party/polymer
		third_party/catapult/third_party/py_vulcanize
		third_party/catapult/third_party/py_vulcanize/third_party/rcssmin
		third_party/catapult/third_party/py_vulcanize/third_party/rjsmin
		third_party/catapult/tracing/third_party/d3
		third_party/catapult/tracing/third_party/gl-matrix
		third_party/catapult/tracing/third_party/jszip
		third_party/catapult/tracing/third_party/mannwhitneyu
		third_party/ced
		third_party/cld_2
		third_party/cld_3
		third_party/cros_system_api
		third_party/cython/python_flags.py
		third_party/devscripts
		third_party/dom_distiller_js
		third_party/fips181
		third_party/flatbuffers
		third_party/flot
		third_party/google_input_tools
		third_party/google_input_tools/third_party/closure_library
		third_party/google_input_tools/third_party/closure_library/third_party/closure
		third_party/hunspell
		third_party/iccjpeg
		third_party/icu
		third_party/jstemplate
		third_party/khronos
		third_party/leveldatabase
		third_party/libXNVCtrl
		third_party/libaddressinput
		third_party/libjingle
		third_party/libphonenumber
		third_party/libsecret
		third_party/libsrtp
		third_party/libudev
		third_party/libusb
		third_party/libwebm
		third_party/libxml/chromium
		third_party/libyuv
		third_party/lss
		third_party/lzma_sdk
		third_party/mesa
		third_party/modp_b64
		third_party/mt19937ar
		third_party/openh264
		third_party/openmax_dl
		third_party/opus
		third_party/ots
		third_party/pdfium
		third_party/pdfium/third_party/agg23
		third_party/pdfium/third_party/base
		third_party/pdfium/third_party/bigint
		third_party/pdfium/third_party/freetype
		third_party/pdfium/third_party/lcms2-2.6
		third_party/pdfium/third_party/libjpeg
		third_party/pdfium/third_party/libopenjpeg20
		third_party/pdfium/third_party/libpng16
		third_party/pdfium/third_party/libtiff
		third_party/pdfium/third_party/zlib_v128
		third_party/polymer
		third_party/protobuf
		third_party/protobuf/third_party/six
		third_party/qcms
		third_party/sfntly
		third_party/skia
		third_party/smhasher
		third_party/sqlite
		third_party/tcmalloc
		third_party/usrsctp
		third_party/web-animations-js
		third_party/webdriver
		third_party/webrtc
		third_party/widevine
		third_party/woff2
		third_party/x86inc
		third_party/zlib/google
		url/third_party/mozilla
		v8/src/third_party/valgrind
	)
	if ! use system-ffmpeg; then
		keeplibs+=( third_party/ffmpeg )
	fi
	if use gn; then
		keeplibs+=(
			base/third_party/libevent
			third_party/adobe
			third_party/speech-dispatcher
			third_party/usb_ids
			third_party/xdg-utils
			third_party/yasm/run_yasm.py
		)
	fi
	if use nacl; then
		keeplibs+=(
			native_client/src/third_party/dlmalloc
		)
	fi

	# Remove most bundled libraries. Some are still needed.
	build/linux/unbundle/remove_bundled_libraries.py "${keeplibs[@]}" --do-remove || die
}

src_configure() {
	local myconf_gyp=""
	local myconf_gn=""

	# GN needs explicit config for Debug/Release as opposed to inferring it from build directory.
	myconf_gn+=" is_debug=false"

	# Never tell the build system to "enable" SSE2, it has a few unexpected
	# additions, bug #336871.
	myconf_gyp+=" -Ddisable_sse2=1"

	if ! use nacl ; then
		myconf_gyp+=" -Ddisable_nacl=1"
		myconf_gn+=" enable_nacl=false"
	fi

	# Make it possible to remove third_party/adobe.
	echo > "${T}/flapper_version.h" || die
	myconf_gyp+=" -Dflapper_version_h_file=${T}/flapper_version.h"

	# Use system-provided libraries.
	# TODO: use_system_hunspell (upstream changes needed).
	# TODO: use_system_icu (bug #576370).
	# TODO: use_system_libsrtp (bug #459932).
	# TODO: use_system_libusb (http://crbug.com/266149).
	# TODO: use_system_opus (https://code.google.com/p/webrtc/issues/detail?id=3077).
	# TODO: use_system_protobuf (bug #525560).
	# TODO: use_system_ssl (http://crbug.com/58087).
	# TODO: use_system_sqlite (http://crbug.com/22208).
	myconf_gyp+="
		-Duse_system_bzip2=1
		-Duse_system_ffmpeg=$(usex system-ffmpeg 1 0)
		-Duse_system_flac=1
		-Duse_system_harfbuzz=1
		-Duse_system_jsoncpp=1
		-Duse_system_libevent=1
		-Duse_system_libpng=1
		-Duse_system_libvpx=1
		-Duse_system_libwebp=1
		-Duse_system_libxml=1
		-Duse_system_libxslt=1
		-Duse_system_minizip=1
		-Duse_system_nspr=1
		-Duse_system_snappy=1
		-Duse_system_speex=1
		-Duse_system_xdg_utils=1
		-Duse_system_zlib=1"

	# libevent: https://bugs.gentoo.org/593458
	local gn_system_libraries="
		flac
		harfbuzz-ng
		libjpeg
		libpng
		libvpx
		libwebp
		libxml
		libxslt
		re2
		snappy
		yasm
		zlib"
	if use system-ffmpeg; then
		gn_system_libraries+=" ffmpeg"
	fi
	build/linux/unbundle/replace_gn_files.py --system-libraries ${gn_system_libraries} || die

	# Needed for system icu - we don't need additional data files.
	# myconf_gyp+=" -Dicu_use_data_file_flag=0"

	# TODO: patch gyp so that this arm conditional is not needed.
	if ! use arm; then
		myconf_gyp+="
			-Duse_system_yasm=1"
	fi

	# Optional dependencies.
	# TODO: linux_link_kerberos, bug #381289.
	myconf_gyp+="
		$(gyp_use cups)
		$(gyp_use gnome use_gconf)
		$(gyp_use gnome-keyring use_gnome_keyring)
		$(gyp_use gnome-keyring linux_link_gnome_keyring)
		$(gyp_use gtk3)
		$(gyp_use hangouts enable_hangout_services_extension)
		$(gyp_use kerberos)
		$(gyp_use pulseaudio)
		$(gyp_use tcmalloc use_allocator tcmalloc none)
		$(gyp_use widevine enable_widevine)"

	myconf_gn+=" enable_hangout_services_extension=$(usex hangouts true false)"
	myconf_gn+=" enable_widevine=$(usex widevine true false)"
	myconf_gn+=" use_cups=$(usex cups true false)"
	myconf_gn+=" use_gconf=$(usex gnome true false)"
	myconf_gn+=" use_gnome_keyring=$(usex gnome-keyring true false)"
	myconf_gn+=" use_gtk3=$(usex gtk3 true false)"
	myconf_gn+=" use_kerberos=$(usex kerberos true false)"
	myconf_gn+=" use_pulseaudio=$(usex pulseaudio true false)"

	# Use explicit library dependencies instead of dlopen.
	# This makes breakages easier to detect by revdep-rebuild.
	myconf_gyp+="
		-Dlinux_link_gsettings=1
		-Dlinux_link_libpci=1
		-Dlinux_link_libspeechd=1
		-Dlibspeechd_h_prefix=speech-dispatcher/"

	# TODO: link_pulseaudio=true for GN.

	# TODO: use the file at run time instead of effectively compiling it in.
	myconf_gyp+="
		-Dusb_ids_path=/usr/share/misc/usb.ids"

	myconf_gyp+=" -Dfieldtrial_testing_like_official_build=1"
	myconf_gn+=" fieldtrial_testing_like_official_build=true"

	if tc-is-clang; then
		myconf_gyp+=" -Dclang=1"
		myconf_gn+=" is_clang=true clang_base_path=\"/usr\" clang_use_chrome_plugins=false"
	else
		myconf_gyp+=" -Dclang=0"
		myconf_gn+=" is_clang=false"
	fi

	# Never use bundled gold binary. Disable gold linker flags for now.
	# Do not use bundled clang.
	myconf_gyp+="
		-Dclang_use_chrome_plugins=0
		-Dhost_clang=0
		-Dlinux_use_bundled_binutils=0
		-Dlinux_use_bundled_gold=0
		-Dlinux_use_gold_flags=0
		-Dsysroot="
	# Trying to use gold results in linker crash.
	myconf_gn+=" use_gold=false use_sysroot=false linux_use_bundled_binutils=false"

	ffmpeg_branding="$(usex proprietary-codecs Chrome Chromium)"
	myconf_gyp+=" -Dproprietary_codecs=1 -Dffmpeg_branding=${ffmpeg_branding}"
	myconf_gn+=" proprietary_codecs=$(usex proprietary-codecs true false)"
	myconf_gn+=" ffmpeg_branding=\"${ffmpeg_branding}\""

	# Set up Google API keys, see http://www.chromium.org/developers/how-tos/api-keys .
	# Note: these are for Gentoo use ONLY. For your own distribution,
	# please get your own set of keys. Feel free to contact chromium@gentoo.org
	# for more info.
	local google_api_key="AIzaSyDEAOvatFo0eTgsV_ZlEzx0ObmepsMzfAc"
	local google_default_client_id="329227923882.apps.googleusercontent.com"
	local google_default_client_secret="vgKG0NNv7GoDpbtoFNLxCUXu"
	myconf_gyp+=" -Dgoogle_api_key=${google_api_key}
		-Dgoogle_default_client_id=${google_default_client_id}
		-Dgoogle_default_client_secret=${google_default_client_secret}"
	myconf_gn+=" google_api_key=\"${google_api_key}\""
	myconf_gn+=" google_default_client_id=\"${google_default_client_id}\""
	myconf_gn+=" google_default_client_secret=\"${google_default_client_secret}\""

	local myarch="$(tc-arch)"
	if [[ $myarch = amd64 ]] ; then
		target_arch=x64
		ffmpeg_target_arch=x64
	elif [[ $myarch = x86 ]] ; then
		target_arch=ia32
		ffmpeg_target_arch=ia32
	elif [[ $myarch = arm64 ]] ; then
		target_arch=arm64
		ffmpeg_target_arch=arm64
	elif [[ $myarch = arm ]] ; then
		target_arch=arm
		ffmpeg_target_arch=$(usex neon arm-neon arm)
		# TODO: re-enable NaCl (NativeClient).
		local CTARGET=${CTARGET:-${CHOST}}
		if [[ $(tc-is-softfloat) == "no" ]]; then

			myconf_gyp+=" -Darm_float_abi=hard"
		fi
		filter-flags "-mfpu=*"
		use neon || myconf_gyp+=" -Darm_fpu=${ARM_FPU:-vfpv3-d16}"

		if [[ ${CTARGET} == armv[78]* ]]; then
			myconf_gyp+=" -Darmv7=1"
		else
			myconf_gyp+=" -Darmv7=0"
		fi
		myconf_gyp+=" -Dsysroot=
			$(gyp_use neon arm_neon)
			-Ddisable_nacl=1"
	else
		die "Failed to determine target arch, got '$myarch'."
	fi

	myconf_gyp+=" -Dtarget_arch=${target_arch}"

	# Make sure that -Werror doesn't get added to CFLAGS by the build system.
	# Depending on GCC version the warnings are different and we don't want
	# the build to fail because of that.
	myconf_gyp+=" -Dwerror="
	myconf_gn+=" treat_warnings_as_errors=false"

	# Disable fatal linker warnings, bug 506268.
	myconf_gyp+=" -Ddisable_fatal_linker_warnings=1"
	myconf_gn+=" fatal_linker_warnings=false"

	# Avoid CFLAGS problems, bug #352457, bug #390147.
	if ! use custom-cflags; then
		replace-flags "-Os" "-O2"
		strip-flags

		# Prevent linker from running out of address space, bug #471810 .
		if use x86; then
			filter-flags "-g*"
		fi

		# Prevent libvpx build failures. Bug 530248, 544702, 546984.
		if [[ ${myarch} == amd64 || ${myarch} == x86 ]]; then
			filter-flags -mno-mmx -mno-sse2 -mno-ssse3 -mno-sse4.1 -mno-avx -mno-avx2
		fi
	fi

	if use nacl; then
		filter-flags -fstack-protector -fstack-protector-strong
		append-flags -fno-stack-protector
	fi

	# Make sure the build system will use the right tools, bug #340795.
	tc-export AR CC CXX NM

	# Define a custom toolchain for GN
	myconf_gn+=" custom_toolchain=\"${FILESDIR}/toolchain:default\""

	# Tools for building programs to be executed on the build system, bug #410883.
	if tc-is-cross-compiler; then
		export AR_host=$(tc-getBUILD_AR)
		export CC_host=$(tc-getBUILD_CC)
		export CXX_host=$(tc-getBUILD_CXX)
		export NM_host=$(tc-getBUILD_NM)
	fi

	# Bug 491582.
	export TMPDIR="${WORKDIR}/temp"
	mkdir -p -m 755 "${TMPDIR}" || die

	if ! use system-ffmpeg; then
		local build_ffmpeg_args=""
		if use pic && [[ "${ffmpeg_target_arch}" == "ia32" ]]; then
			build_ffmpeg_args+=" --disable-asm"
		fi

		# Re-configure bundled ffmpeg. See bug #491378 for example reasons.
		einfo "Configuring bundled ffmpeg..."
		pushd third_party/ffmpeg > /dev/null || die
		chromium/scripts/build_ffmpeg.py linux ${ffmpeg_target_arch} \
			--branding ${ffmpeg_branding} -- ${build_ffmpeg_args} || die
		chromium/scripts/copy_config.sh || die
		chromium/scripts/generate_gyp.py || die
		popd > /dev/null || die
	fi

	third_party/libaddressinput/chromium/tools/update-strings.py || die

	touch chrome/test/data/webui/i18n_process_css_test.html || die

	einfo "Configuring Chromium..."
	if use gn; then
		# TODO: bootstrapped gn binary hangs when using tcmalloc with portage's sandbox.
		tools/gn/bootstrap/bootstrap.py -v --gn-gen-args "${myconf_gn} use_allocator=\"none\"" || die
		myconf_gn+=" use_allocator=$(usex tcmalloc \"tcmalloc\" \"none\")"
		out/Release/gn gen --args="${myconf_gn}" out/Release || die
	else
		build/linux/unbundle/replace_gyp_files.py ${myconf_gyp} || die
		egyp_chromium ${myconf_gyp} || die
	fi
}

eninja() {
	if [[ -z ${NINJAOPTS+set} ]]; then
		local jobs=$(makeopts_jobs)
		local loadavg=$(makeopts_loadavg)

		if [[ ${MAKEOPTS} == *-j* && ${jobs} != 999 ]]; then
			NINJAOPTS+=" -j ${jobs}"
		fi
		if [[ ${MAKEOPTS} == *-l* && ${loadavg} != 999 ]]; then
			NINJAOPTS+=" -l ${loadavg}"
		fi
	fi
	set -- ninja -v ${NINJAOPTS} "$@"
	echo "$@"
	"$@"
}

src_compile() {
	local ninja_targets="chrome chromedriver"
	if use suid; then
		ninja_targets+=" chrome_sandbox"
	fi

	# Build mksnapshot and pax-mark it.
	eninja -C out/Release mksnapshot || die
	pax-mark m out/Release/mksnapshot

	# Even though ninja autodetects number of CPUs, we respect
	# user's options, for debugging with -j 1 or any other reason.
	eninja -C out/Release ${ninja_targets} || die

	pax-mark m out/Release/chrome
}

src_install() {
	local CHROMIUM_HOME="/usr/$(get_libdir)/chromium-browser${CHROMIUM_SUFFIX}"
	exeinto "${CHROMIUM_HOME}"
	doexe out/Release/chrome || die

	if use suid; then
		newexe out/Release/chrome_sandbox chrome-sandbox || die
		fperms 4755 "${CHROMIUM_HOME}/chrome-sandbox"
	fi

	doexe out/Release/chromedriver || die
	use widevine && doexe out/Release/libwidevinecdmadapter.so

	if use nacl; then
		doexe out/Release/nacl_helper{,_bootstrap} || die
		insinto "${CHROMIUM_HOME}"
		doins out/Release/nacl_irt_*.nexe || die
	fi

	local sedargs=( -e "s:/usr/lib/:/usr/$(get_libdir)/:g" )
	if [[ -n ${CHROMIUM_SUFFIX} ]]; then
		sedargs+=(
			-e "s:chromium-browser:chromium-browser${CHROMIUM_SUFFIX}:g"
			-e "s:chromium.desktop:chromium${CHROMIUM_SUFFIX}.desktop:g"
			-e "s:plugins:plugins --user-data-dir=\${HOME}/.config/chromium${CHROMIUM_SUFFIX}:"
		)
	fi
	sed "${sedargs[@]}" "${FILESDIR}/chromium-launcher-r3.sh" > chromium-launcher.sh || die
	doexe chromium-launcher.sh

	# It is important that we name the target "chromium-browser",
	# xdg-utils expect it; bug #355517.
	dosym "${CHROMIUM_HOME}/chromium-launcher.sh" /usr/bin/chromium-browser${CHROMIUM_SUFFIX} || die
	# keep the old symlink around for consistency
	dosym "${CHROMIUM_HOME}/chromium-launcher.sh" /usr/bin/chromium${CHROMIUM_SUFFIX} || die

	dosym "${CHROMIUM_HOME}/chromedriver" /usr/bin/chromedriver${CHROMIUM_SUFFIX} || die

	# Allow users to override command-line options, bug #357629.
	dodir /etc/chromium || die
	insinto /etc/chromium
	newins "${FILESDIR}/chromium.default" "default" || die

	pushd out/Release/locales > /dev/null || die
	chromium_remove_language_paks
	popd

	insinto "${CHROMIUM_HOME}"
	doins out/Release/*.bin || die
	doins out/Release/*.pak || die

	doins out/Release/icudtl.dat || die

	doins -r out/Release/locales || die
	doins -r out/Release/resources || die

	newman out/Release/chrome.1 chromium${CHROMIUM_SUFFIX}.1 || die
	newman out/Release/chrome.1 chromium-browser${CHROMIUM_SUFFIX}.1 || die

	# Install icons and desktop entry.
	local branding size
	for size in 16 22 24 32 48 64 128 256 ; do
		case ${size} in
			16|32) branding="chrome/app/theme/default_100_percent/chromium" ;;
				*) branding="chrome/app/theme/chromium" ;;
		esac
		newicon -s ${size} "${branding}/product_logo_${size}.png" \
			chromium-browser${CHROMIUM_SUFFIX}.png
	done

	local mime_types="text/html;text/xml;application/xhtml+xml;"
	mime_types+="x-scheme-handler/http;x-scheme-handler/https;" # bug #360797
	mime_types+="x-scheme-handler/ftp;" # bug #412185
	mime_types+="x-scheme-handler/mailto;x-scheme-handler/webcal;" # bug #416393
	make_desktop_entry \
		chromium-browser${CHROMIUM_SUFFIX} \
		"Chromium${CHROMIUM_SUFFIX}" \
		chromium-browser${CHROMIUM_SUFFIX} \
		"Network;WebBrowser" \
		"MimeType=${mime_types}\nStartupWMClass=chromium-browser"
	sed -e "/^Exec/s/$/ %U/" -i "${ED}"/usr/share/applications/*.desktop || die

	# Install GNOME default application entry (bug #303100).
	if use gnome; then
		dodir /usr/share/gnome-control-center/default-apps || die
		insinto /usr/share/gnome-control-center/default-apps
		newins "${FILESDIR}"/chromium-browser.xml chromium-browser${CHROMIUM_SUFFIX}.xml || die
		if [[ "${CHROMIUM_SUFFIX}" != "" ]]; then
			sed "s:chromium-browser:chromium-browser${CHROMIUM_SUFFIX}:g" -i \
				"${ED}"/usr/share/gnome-control-center/default-apps/chromium-browser${CHROMIUM_SUFFIX}.xml
		fi
	fi

	readme.gentoo_create_doc
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	readme.gentoo_print_elog
}
