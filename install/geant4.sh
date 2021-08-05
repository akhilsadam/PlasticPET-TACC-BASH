# bash script to run on TACC to install G4 10.7.2.
# This script is untested and only serves as a log of my operations.

cd $STOCKYARD/utklshare
mkdir geant4
cd geant4
wget https://github.com/Geant4/geant4/archive/refs/tags/v10.7.2.tar.gz
tar -xzvf v10.7.2.tar.gz
ls
mv geant4-10.7.2 geant4-src
mkdir geant4-install/
mkdir geant4-data/
mkdir geant4-build/ && cd geant4-build
cd ../../

mkdir xercesc
cd xercesc
mkdir installdir
wget https://mirror.cogentco.com/pub/apache//xerces/c/3/sources/xerces-c-3.2.3.tar.gz
tar -xzvf xerces-c-3.2.3.tar.gz
cd xerces-c-3.2.3/
./configure --disable-static CC=icc CXX=icpc CFLAGS=-O3 CXXFLAGS=-O3 --prefix=$STOCKYARD/utklshare/xercesc/installdir
make -j8
make install 
export XercesC_LIBRARY=$STOCKYARD/utklshare/xercesc/installdir/lib
export XercesC_INCLUDE_DIR=$STOCKYARD/utklshare/xercesc/installdir/include
export XercesC_VERSION=3.2.3
cd ../../

<<COMMENT
mkdir gcc && cd gcc
mkdir install-9
mkdir build-9
wget http://mirrors.concertpass.com/gcc/releases/gcc-9.3.0/gcc-9.3.0.tar.xz
tar -xvf gcc-9.3.0.tar.xz
cd gcc-9.3.0
./contrib/download_prerequisites
cd ../build-9
$PWD/../gcc-9.3.0/configure --prefix=$STOCKYARD/utklshare/gcc/install-9 --enable-languages=c,c++,fortran,go --enable-multilib
make -j48
make install
COMMENT

<<COMMENT
mkdir gcc && cd gcc
mkdir install
mkdir build
wget http://mirrors.concertpass.com/gcc/releases/gcc-10.1.0/gcc-10.1.0.tar.xz
tar -xvf gcc-10.1.0.tar.xz
cd gcc-10.1.0
./contrib/download_prerequisites
cd ../build
$PWD/../gcc-10.1.0/configure --prefix=$STOCKYARD/utklshare/gcc/install --enable-languages=c,c++,fortran,go --enable-multilib
make -j8
make install
COMMENT

# mkdir qt
# cd qt
# mkdir installdir
# mkdir build
# wget https://download.qt.io/official_releases/qt/5.15/5.15.2/single/qt-everywhere-src-5.15.2.tar.xz
# tar -xvf qt-everywhere-src-5.15.2.tar.xz
# #cd qt-everywhere-src-6.1.2
# # does not work due to symlinks
# cd /work2/07752/as_tacc/utklshare/qt/qt-everywhere-src-5.15.2
# ./configure -release -opensource -nomake examples -nomake tests \
# -skip qtdocgallery -confirm-license -opengl desktop \
# -platform linux-g++-64 -prefix $PWD/qtbase
# gmake -j16
# cd ../../
# ### cmake --std=c++17 --build . (run prior to previous 2 cmds)
# ### No need for QT; there exists a QT5 module!

cd lib
yumdownloader libxcb
rpm2cpio libxcb-1.13-1.el7.x86_64.rpm | cpio -id
cd ..



cd geant4/geant4-build/

cmake   \
	-DCMAKE_C_COMPILER=icc \
	-DCMAKE_CXX_COMPILER=icpc \
	-DCMAKE_CXX_FLAGS="-O3 -DNDEBUG -xCORE-AVX2 -axMIC-AVX512,CORE-AVX512 -w1 -Wno-non-virtual-dtor -Wpointer-arith -Wwrite-strings -fp-model precise" \
	-DCMAKE_C_FLAGS="-O3 -DNDEBUG -xCORE-AVX2 -axMIC-AVX512,CORE-AVX512 -g3" \
    -DCMAKE_PREFIX_PATH=/work2/07752/as_tacc/utklshare/xercesc/installdir
    -DQt5Core_DIR=/work2/07752/as_tacc/utklshare/qt/qt-everywhere-src-5.15.2/qtbase/lib/cmake/Qt5Core/ \
    -DQt5Gui_DIR=/work2/07752/as_tacc/utklshare/qt/qt-everywhere-src-5.15.2/qtbase/lib/cmake/Qt5Gui/ \
    -DQt5Widgets_DIR=/work2/07752/as_tacc/utklshare/qt/qt-everywhere-src-5.15.2/qtbase/lib/cmake/Qt5Widgets/ \
    -DQt5OpenGL_DIR=/work2/07752/as_tacc/utklshare/qt/qt-everywhere-src-5.15.2/qtbase/lib/cmake/Qt5OpenGL/ \
    -DQt5PrintSupport_DIR=/work2/07752/as_tacc/utklshare/qt/qt-everywhere-src-5.15.2/qtbase/lib/cmake/Qt5PrintSupport/ \
    -DGEANT4_BUILD_CXXSTD=17 \
	-DCMAKE_INSTALL_PREFIX=../geant4-install \
	-DGEANT4_INSTALL_DATADIR=geant4-data \
	-DGEANT4_BUILD_MULTITHREADED=ON \
    -DGEANT4_INSTALL_DATA=ON \
    -DGEANT4_USE_GDML=ON \
    -DGEANT4_USE_OPENGL_X11=ON \
    -DGEANT4_USE_QT=ON \
    -DGEANT4_USE_RAYTRACER_X11=ON \
    -DG4MULTITHREADED=ON \
    -DGEANT4_BUILD_MULTITHREADED=ON \
	../geant4-src

make -j16
make install