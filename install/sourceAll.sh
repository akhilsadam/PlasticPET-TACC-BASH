# bash script to source both Root and Geant4  - necessary for anything - do the sourcing upon opening your terminal or add it to .bashrc
# run source sourceAll.sh
export sharedir=/work2/07752/as_tacc/utklshare
export PATH=$PATH:$sharedir/root/
export PATH=$PATH:$sharedir/root/bin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$sharedir/root/icons/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$sharedir/root/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$sharedir/lib/usr/lib64/
# export QT_QPA_PLATFORM_PLUGIN_PATH=/work2/07752/as_tacc/utklshare/qt/qt-everywhere-src-5.15.2/qtbase/src/plugins/platforms/
# export QT_QPA_PLATFORM=vnc
source $sharedir/root/bin/thisroot.sh
echo "Sourced ROOT."
export XercesC_LIBRARY=$STOCKYARD/utklshare/xercesc/installdir/lib/libxerces-c.so
export XercesC_INCLUDE_DIR=$STOCKYARD/utklshare/xercesc/installdir/include
export XercesC_VERSION=3.2.3
export LD_LIBRARY_PATH=$STOCKYARD/utklshare/xercesc/installdir/lib:$LD_LIBRARY_PATH
export LD_RUN_PATH=$XercesC_LIBRARY:$LD_RUN_PATH
export PATH=$PATH:$sharedir/geant4/geant4-install/bin/
export PATH=$PATH:$sharedir/geant4/geant4-install/include/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$sharedir/geant4/geant4-install/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$sharedir/geant4/geant4-install/lib64/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$sharedir/geant4/geant4-install/include/Geant4/
source $sharedir/geant4/geant4-install/bin/geant4.sh
echo "Sourced Geant4."

<< COMMENT
export sharedir=/work2/07752/as_tacc/utklshare/
source $sharedir/sourceAll.sh
make clean
cmake -DCMAKE_C_COMPILER=icc \
      -DCMAKE_CXX_COMPILER=icpc \
      -DGeant4_DIR=$sharedir/geant4/geant4-install \
      -DROOT_INCLUDE_DIRS=$sharedir/root/include \
      -DCMAKE_PREFIX_PATH=$sharedir/geant4/geant4-install \
      directory to source..
make -j48
COMMENT
