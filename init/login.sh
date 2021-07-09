#!/bin/bash
# A script to run PlasticPET on stampede2: login copies remote and runs remote.
# The SCP will only need to be run the first time, and the corresponding clones in remote.sh can then be commented out.
cd bash
git add .
git commit -a -m "Update Bash"
git push origin master
scp init/remote.sh as_tacc@stampede2.tacc.utexas.edu:/work2/07752/as_tacc/Desktop/PlasticPET/bash/init/remote.sh
ssh -X  -t -t as_tacc@stampede2.tacc.utexas.edu "bash source /work2/07752/as_tacc/Desktop/PlasticPET/bash/init/remote.sh & xterm ; fg"