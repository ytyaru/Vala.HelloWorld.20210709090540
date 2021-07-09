#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# vala言語でGTKを使う。
# CreatedAt: 2021-07-09
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	ExistCmd() { type "$1" > /dev/null 2>&1; }
	InstallCmd() { ExistCmd $1 || sudo apt install -y $1; }
	Build() { valac --pkg gtk+-3.0 "$1"; }

	InstallCmd valac
	cd "$HERE"
	NAME=hello
	Build $NAME.vala
	./$NAME
}
Run "$@"
