export sharedir=/work2/07752/as_tacc/utklshare/
source $sharedir/sourceAll.sh
export bashdir=$PWD
bash preRun.sh
bash Run.sh
bash postRun.sh