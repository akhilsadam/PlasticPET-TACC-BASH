#bash script to install root.
cd $STOCKYARD/utklshare
mkdir root
cd root

# wget https://root.cern/download/root_v6.24.02.Linux-centos7-x86_64-gcc4.8.tar.gz
# tar -xzvf root_v6.24.02.Linux-centos7-x86_64-gcc4.8.tar.gz
# source root/bin/thisroot.sh # also available: thisroot.{csh,fish,bat}
# export PATH=$PATH:$STOCKYARD/utklshare/root/bin/

wget https://root.cern/download/root_v6.24.02.source.tar.gz
tar -xzvf root_v6.24.02.source.tar.gz
cd root-6.24.02/
mkdir build-root/ && cd build-root/

cmake -DCMAKE_C_COMPILER=gcc \
      -DCMAKE_CXX_COMPILER=g++ \
      -DCMAKE_CXX_STANDARD=17 \
      -Dgminimal=ON \
      -DCMAKE_INSTALL_PREFIX=/work/07752/as_tacc/utklshare/root \
      ../ 

make -j4
make install
export PATH=$PATH:$STOCKYARD/utklshare/root/bin/

#installing root from source! CXXSTD=17 and gcc compiler 9.1.0



mkdir ../lib
cd ../lib
export PATH=$PATH:$PWD/
wget https://rpmfind.net/linux/remi/enterprise/8/remi/x86_64/libzstd-1.4.2-1.el8.remi.x86_64.rpm
export ins=libzstd-1.4.2-1.el8.remi.x86_64.rpm
rpm2cpio $ins | cpio -idv
wget ftp://ftp.pbone.net/mirror/ftp.redhat.com/pub/redhat/rhel/rhel-8-beta/baseos/x86_64/Packages/ncurses-libs-6.1-5.20180224.el8.x86_64.rpm
export ins=ncurses-libs-6.1-5.20180224.el8.x86_64.rpm
rpm2cpio $ins | cpio -idv
cd usr/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$STOCKYARD/utklshare/lib/usr/lib64/
cd ../../../../
