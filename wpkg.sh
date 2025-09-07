#!/bin/bash

# wpkg.exec <option> "package" "package"...

wpkg.exec() {
	#    1   :    2   :    3    :    4   :             5
 	# method : update : install : remove : non interactive parameter.
	# apt:apt update:apt install:apt remove:-y # <- example

	local PKGMNGR=(
		"apt:apt update"
		"pacman: pacman -Syy"
		"zypper: zypper refresh"
		"dnf: dnf check-update --refresh"
	)

	local status="true" select="auto" legacy="false" BASE="unknown" ARGOPT=()

	while [[ "${#}" -gt 0 ]] ; do
		case "${1,,}" in
			("--select")
				shift
				if [[ -n "${1}" ]] ; then
					local select="${1}"
				fi
			;;
            ("--legacy")
                shift
                if [[ -n "${1}" ]] ; then
                    local legacy="${1}"
                fi
            ;;
            ("--base")
                shift
                if [[ -n "${1}" ]] ; then
                    local BASE="${1}"
                fi
            ;;
			(*)
				local ARGOPT+=("${1}")
				shift
			;;
		esac
	done
	echo "${select} - ${legacy} - ${BASE} [${ARGOPT[@]}]"
}

if [[ "${BASH_SOURCE[-1]}" = "${0}" ]] ; then
	wpkg.exec "${@}"
fi
