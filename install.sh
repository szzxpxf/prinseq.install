#!/bin/sh
set -e -x

# installer for prinseq
#
# create your base folder
mkdir -p /opt/prinseq
cd /opt/prinseq
# do the work
BASE_FOLDER=/opt/prinseq

# install cpanm
yum install -y make gcc perl
curl -L http://cpanmin.us | perl - App::cpanminus

# prinseq native deps: cairo libs
yum install -y cairo cairo-devel perl-Pod-* perl-ExtUtils-*

# install module::build
cpanm Module::Build
# MatrixReal
cpanm Math::MatrixReal
# rest of modules
cpanm Data::Dumper::Names Time::HiRes
cpanm CPAN::Meta ExtUtils::ParseXS
cpanm Getopt::Long File::Temp Digest::MD5 Version::Requirements 
cpanm Fcntl Cwd JSON Cairo Statistics::PCA MIME::Base64
# download prinseq, install
wget http://resources.ohnosequences.com/prinseq/latest/prinseq-lite-0.19.4.tar.gz
tar -xzf prinseq-lite-0.19.4.tar.gz
rm prinseq-lite-0.19.4.tar.gz
chmod u+x prinseq-lite-0.19.4/*.pl
# links
ln -sf $BASE_FOLDER/prinseq-lite-0.19.4/*.pl /usr/bin/
