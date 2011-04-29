#!/bin/bash
#
# To install you need to execute with 'sudo'.
#

admin_email="ulissesmonhecosta@gmail.com"
portins="port install"
aptiins="aptitude install"
andlogfile="tee -a main.log"

function install_package {
	case `uname -s` in
		"Darwin")
			install_macosx
			;;
		"Linux")
			case `uname -v` in
				*"Ubuntu"*)
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
	port install gd2
	install_perl_mac
	install_perl_modules
}

function install_ubuntu {
	echo "Working on a Ubuntu machine" | $andlogfile
	#install_aptitude_modules libgd-dev
	install_perl_ub
	#install_perl_modules
}

function install_aptitude_modules {
	for pkg in $@; do
		dpkg -s $pkg
		if [ $? -eq 0 ]; then
			echo "module $pkg installed" | $andlogfile
		else
			echo "module $pkg not installed, installing..." | $andlogfile
			aptitude --assume-yes install $pkg
		fi
	done;
}

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

function check_user_id {
	echo "`whoami` started this script installation file at `date`" | $andlogfile
	if [ ! "`whoami`" = "root" ]; then
		echo "Not running as root. Yes, this is an installation file..." | $andlogfile
		exit 1 ;
	fi
}

function install_perl_mac {
	echo "`whoami` is trying to install Perl" | $andlogfile
	$portins perl
	if [ $? ]; then
		echo "Unsuccessful!" | $andlogfile;
	else
		echo "Successful!" | $andlogfile;
	fi
}

function install_perl_ub {
	echo "`whoami` is trying to install Perl" | $andlogfile
	$aptiins perl
	if [ $? ]; then
		echo "Unsuccessful!" | $andlogfile;
	else
		echo "Successful!" | $andlogfile;
	fi
}

function install_rvm_and_ruby {
	# Install RVM
	#bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
	curl -s https://rvm.beginrescueend.com/install/rvm | bash 
	# Install some rubies
	source "$HOME/.rvm/scripts/rvm"
	rvm get head
	rvm reload
	rvm install 1.8.7
	rvm --default 1.8.7
}

function install_rails {
	#sudo apt-get install rubygems
	#sudo apt-get install libxslt-dev libxml2-dev libsqlite3-dev
	gem install rails --version 3.0.3
	cd sample_app
	bundle install
	cd -
}

check_user_id
install_package
#install_perl
#install_rvm_and_ruby
#install_rails
exit 0;

