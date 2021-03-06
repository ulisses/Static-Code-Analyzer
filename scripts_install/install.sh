#!/bin/bash
#
# To install you need to execute with 'sudo'.
#

#================================================================
#		Variables and shortcuts
#================================================================

admin_email="ulissesmonhecosta@gmail.com"
portins="port install"
aptiins="aptitude --assume-yes install"
andlogfile="tee -a main.log"
varmac=0
varubu=0

#================================================================
#		System verification and installation
#================================================================

function check_user_id {
	echo "`whoami` started this script installation file at `date`" | $andlogfile
	if [ ! "`whoami`" = "root" ]; then
		echo "Not running as root. Yes, this is an installation file..." | $andlogfile
		exit 1 ;
	fi
}

function install_package {
	case `uname -s` in
	"Darwin")
		varmac=1
		install_macosx
	;;
	"Linux")
		case `uname -v` in
		*"Ubuntu"*)
			varubu=1
			install_ubuntu
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

function install_macosx {
	echo "Working on a MacOSX machine" | $andlogfile
	build_haskell
	$portins gd2
	install_perl
	install_perl_modules
}

function install_ubuntu {
	echo "var = $varubu"
	echo "Working on a Ubuntu machine" | $andlogfile
	build_haskell
	#install_aptitude_modules libgd-dev
	#install_perl
	#install_perl_modules
}

#================================================================
#		Haskell and haskell's things
#================================================================

function build_haskell {
	which ghc 1> /dev/null
	if [ $? -eq 0 ]; then
		echo "GHC is installed, I will continue..." | $andlogfile
		which happy 1> /dev/null 
		if [ $? -eq 1 ]; then
			echo "Happy is not installed, I will install" | $andlogfile
			if [ $varubu -eq 1 ]; then 
				$aptiins happy 
			else 	
				if [ $varmac -eq 1 ]; then 
					$portins happy 
				fi 
			fi
		else
			echo "Happy is installed" | $andlogfile
		fi
		which alex 1> /dev/null 
		if [ $? -eq 1 ]; then
			echo "Alex is not installed, I will install" | $andlogfile
			if [ $varubu -eq 1 ]; then 
				$aptiins alex 
			else 	
				if [ $varmac -eq 1 ]; then 
					$portins alex
				fi 
			fi
		else
			echo "Alex is installed" | $andlogfile
		fi
		echo "Trying to install Language.C" | $andlogfile
		build_language_c
		cd Analyzer/language-c-0.3.2.1/
		runhaskell Setup.hs install
		cd - 1> /dev/null
	else
		echo "GHC is not installed, I will do it for you." | $andlogfile
			if [ $varubu -eq 1 ]; then 
				$aptiins ghc
			else 	
				if [ $varmac -eq 1 ]; then 
					$portins ghc
				fi 
			fi
		build_haskell
	fi
}

function build_language_c {
	sudo -u $USER -s 'cd Analyzer/language-c-0.3.2.1/ && runhaskell setup.hs configure && runhaskell setup.hs build && cd -'
}

function install_aptitude_modules {
	for pkg in $@; do
		dpkg -s $pkg
		if [ $? -eq 0 ]; then
			echo "module $pkg installed" | $andlogfile
		else
			echo "module $pkg not installed, installing..." | $andlogfile
			$aptiins $pkg
		fi
	done;
}

#================================================================
#			Perl
#================================================================

function install_perl_modules {
	perl -MCPAN -e '$CPAN->{prerequisites_policy}=follow'
	local packages=(Makefile::Parser Parse::Yapp  GD GD::Graph GD::Graph::bars GD::Graph::pie Path::Class
	          Moose Term::ReadLine Term::ReadLine::Gnu Digest::SHA DBIx::Class Data::Dumper)
	
	if_not_exist_install_perl_modules ${packages[@]}
}

function if_not_exist_install_perl_modules {
	local packages=()
	
	for module in $@; do
		is_perl_module_installed $module
		if [ $? -eq 1 ]; then
			echo "$module installed" | $andlogfile;
		else
			echo "$module not installed, installing..." | $andlogfile;
			packages[$[${#packages[@]}+1]]=$module;
		fi
	done;
	
	EXEC="cpan -if ${packages[@]}"
	$EXEC
}

function is_perl_module_installed {
	if [ -z "`perl -M$1 -e 1 2>&1`" ]; then
		return 1;
	else
		return 0;
	fi
}

function install_perl {
	echo "`whoami` is trying to install Perl" | $andlogfile
	if [ $varubu -eq 1 ]; then 
		$aptiins perl
	else 	
		if [ $varmac -eq 1 ]; then 
			$portins perl
		fi 
	fi
}

#================================================================
#		Ruby, Rails, Gems and ruby's libs
#================================================================
function install_rvm_and_ruby {
	echo "Install RVM (ruby version manager)" | $andlogfile
	curl -s https://rvm.beginrescueend.com/install/rvm | bash 
	echo "Installing ruby version 1.8.7" | $andlogfile
	source "$HOME/.rvm/scripts/rvm"
	rvm get head
	rvm reload
	rvm install 1.8.7
	rvm --default 1.8.7
}

function install_rails {
	echo "Installing ruby gems and libraries" | $andlogfile
	$aptiins rubygems
	$aptiins install libxslt-dev libxml2-dev libsqlite3-dev
	gem install rails --version 3.0.3
	cd sample_app
	bundle install
	cd -
	$aptiins libopenssl-ruby
}

#================================================================
#			Execution
#================================================================

check_user_id
install_package

exit 0;

