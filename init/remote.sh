#!/bin/bash
# remote (on TACC)
ls
# echo "- Loading Modules..."
# module load git
# module load autotools
# module load xalt
# module load TACC
# module load libfabric
# module load cmake/3.16.1
# module load qt5
# module load swr
# module load gcc/9.1.0
# module load python3/3.8.2
# module save
# echo "- Saved Modules."
module list
export sharedir=/work2/07752/as_tacc/utklshare
export TACC=TRUE
export dir2=/home1/07752/as_tacc/Desktop/PlasticPET
source $sharedir/sourceAll.sh
export srcdir=$dir2/src/B3a
export ccdir=$srcdir/src
export incdir=$srcdir/include
export blddir=$dir2/build
export rundir=$dir2/build/B3a
export anlydir=$dir2/analyze
export bashdir=$dir2/bash
export mldir=$dir2/analyze/tools/ML/Models
export pltdir=$dir2/analyze/plots
echo -n "The current directory should be:"; echo $dir2
cd $bashdir
echo "Git Pull: BASH"
#git clone git@github.com:akhilsadam/PlasticPET-TACC-BASH.git
git pull origin master -f
read -p "Press any key to resume ..."
cd $srcdir
echo "Git Pull: SRC"
#git clone git@github.com:akhilsadam/PlasticPET.git
git pull origin master -f
read -p "Press any key to resume ..."
cd $anlydir
echo "Git Pull: ANLY"
#git clone git@github.com:akhilsadam/PlasticPET-ANLY.git
git pull origin master -f
read -p "Press any key to resume ..."
echo "Build"
cd $blddir
make clean
cmake -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_PREFIX_PATH=$sharedir/geant4/geant4-install \
    -DROOT_INCLUDE_DIRS=$sharedir/root/include \
    -DXercesC_LIBRARY=/work2/07752/as_tacc/utklshare/xercesc/installdir/lib/libxerces-c.so \
    /home1/07752/as_tacc/Desktop/PlasticPET/src
make CXX_FLAGS=-DTACC=1 -j49
echo "Run"
cd $rundir
read
# idev -p normal -m 420 -A PET
# export OMP_NUM_THREADS=68
# cd $bashdir
# bash RunAll.sh