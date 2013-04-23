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

# install specific math matrix-real version
/usr/local/bin/cpanm http://search.cpan.org/CPAN/authors/id/L/LE/LETO/Math-MatrixReal-2.05.tar.gz
/usr/local/bin/cpanm Module::Build Data::Dumper::Names Time::HiRes CPAN::Meta ExtUtils::ParseXS Getopt::Long File::Temp Digest::MD5 Version::Requirements Fcntl Cwd JSON Statistics::PCA MIME::Base64
# install cairo without tests -> workaround
/usr/local/bin/cpanm -n Cairo
# download prinseq, install
wget http://resources.ohnosequences.com/prinseq/prinseq-lite-0.20.3.tar.gz
tar -xzf prinseq-lite-0.20.3.tar.gz
rm prinseq-lite-0.20.3.tar.gz
chmod +x prinseq-lite-0.20.3/*.pl
# links
ln -sf $BASE_FOLDER/prinseq-lite-0.20.3/*.pl /usr/bin/
