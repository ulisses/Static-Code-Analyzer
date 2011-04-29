#!/bin/bash
#
# Script to build Static-Code-Analyzer
#

admin_email="ulissesmonhecosta@gmail.com"

function build_all {
	case `uname -s` in
		"Darwin")
			build_macosx
			;;
		"Linux")
			case `uname -v` in
				*"Ubuntu"*)
					build_ubuntu
					;;
				*)
					echo "Your Linux is not supported yet. If it does have a packet manager please send an email to $admin_email"
					exit 1;
					;;
				esac
			;;
		*)
			echo "Your operative system is not supported yet. Please send an email to $admin_email"
			exit 1;
			;;
	esac
}

function is_language_c_installed {
	if [ -z `ghc-pkg list | grep language` ]; then
		return 0;
	else
		return 1;
	fi
}

function is_ghc_installed {
	if [ -z `which ghc` ]; then
		return 0;
	else
		return 1;
	fi
}

function build_language_c {
	cd Parser/language-c-0.3.2.1/
	runhaskell Setup.hs configure
	runhaskell Setup.hs build
	cd -
}

function build_macosx {
	is_ghc_installed
	if [ $? -eq 1 ]; then
		echo "GHC is installed, I will continue..."
		is_language_c_installed
		if [ $? -eq 0 ]; then
			echo "Language.C is not installed, I will install"
			build_language_c
		fi
	else
		echo "GHC is not installed, I will do it for you... Stay here: I will need your sudo password"
		sudo port install ghc
		build_language_c
	fi
}

function build_ubuntu {
	is_ghc_installed
	if [ $? -eq 1 ]; then
		echo "GHC is installed, I will continue..."
		is_language_c_installed
		if [ $? -eq 0 ]; then
			echo "Language.C is not installed, I will install"
			build_language_c
		fi
	else
		echo "GHC is not installed, I will do it for you... Stay here: I will need your sudo password"
		sudo aptitude --assume-yes install ghc
		build_language_c
	fi
}

build_all

