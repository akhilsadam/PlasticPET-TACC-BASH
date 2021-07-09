#!/bin/bash
# remote (on TACC)
ls
echo "- Loading Modules..."
module load git
module load autotools
module load xalt
module load TACC
module load intel
module load libfabric
module load impi
module load python3
module load cmake/3.8.2
module load intel/17.0.4
module load mvapich2/2.3.4
module save
echo "- Saved Modules."
module list
export sharedir=/work2/07752/as_tacc/utklshare/
source $sharedir/sourceAll.sh
export dir2=$PWD/Desktop
export srcdir=$dir2/PlasticPET/src/B3a
export ccdir=$srcdir/src
export incdir=$srcdir/include
export blddir=$dir2/PlasticPET/build
export rundir=$dir2/PlasticPET/build/B3a
export anlydir=$dir2/PlasticPET/analyze
export bashdir=$dir2/PlasticPET/bash
export mldir=$dir2/PlasticPET/analyze/tools/ML/Models
export pltdir=$dir2/PlasticPET/analyze/plots
echo -n "The current directory should be:"; echo $dir2
ls
cd $bashdir
echo "Git Pull: BASH"
git pull origin master -f
read -p "Press any key to resume ..."
cd $srcdir
echo "Git Pull: SRC"
git pull origin master -f
read -p "Press any key to resume ..."
cd $anlydir
echo "Git Pull: ANLY"
git pull origin master -f
read -p "Press any key to resume ..."
echo "Build"
cd $blddir
idev
make clean
cmake -DCMAKE_C_COMPILER=icc \
    -DCMAKE_CXX_COMPILER=icpc \
    -DCMAKE_PREFIX_PATH=$sharedir/geant4/geant4-install \
    /home1/07752/as_tacc/Desktop/PlasticPET/src
make -j48
<<COMMENT
echo "Run"
cd $rundir
./exampleB3a
read
COMMENT