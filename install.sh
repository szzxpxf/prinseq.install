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
yum install -y make gcc perl perl-ExtUtils-*
curl -L http://cpanmin.us | perl - App::cpanminus

# prinseq native deps: cairo libs
yum install -y cairo cairo-devel perl-Pod-*

# install module::build
/usr/local/bin/cpanm Module::Build Math::MatrixReal Data::Dumper::Names Time::HiRes cpanm CPAN::Meta ExtUtils::ParseXS Getopt::Long File::Temp Digest::MD5 Version::Requirements Fcntl Cwd JSON Cairo Statistics::PCA MIME::Base64
# download prinseq, install
wget http://resources.ohnosequences.com/prinseq/prinseq-lite-0.19.4.tar.gz
tar -xzf prinseq-lite-0.19.4.tar.gz
rm prinseq-lite-0.19.4.tar.gz
chmod u+x prinseq-lite-0.19.4/*.pl
# links
ln -sf $BASE_FOLDER/prinseq-lite-0.19.4/*.pl /usr/bin/
