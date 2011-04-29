#!/bin/bash
#
# Script to build Static-Code-Analyzer
#

admin_email="ulissesmonhecosta@gmail.com"

function install_package {
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

function build_macosx {
	if [ is_ghc_installed == 1 ]; then
		echo "GHC is installed, I will continue..."
	else
		echo "GHC is not installed, please go to: http://hackage.haskell.org/platform/mac.html and download and install it"
		echo "Then you can execute this script again..."
		echo "Cmplain about the haskell platform that don't provide a direct link to download the latest package"
	fi
}

function build_ubuntu {
	if [ is_ghc_installed == 1 ]; then
		echo "GHC is installed, I will continue..."
	else
		echo "GHC is not installed, I will do it for you... Stay here: I will need your sudo password"
		sudo aptitude --assume-yes install haskell-platform-doc haskell-platform
	fi
}

function is_ghc_installed {
	if [ -z `which ghc` ]; then
		return 1;
	else
		return 0;
	fi
}

function build_language_c {
	cd Parser/language-c-0.3.2.1/
	runhaskell Setup.hs configure
	runhaskell Setup.hs build
	cd -
}

build_language_c

