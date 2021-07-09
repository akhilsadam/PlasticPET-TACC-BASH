#!/bin/bash
# A script to run PlasticPET on stampede2: login copies remote and runs remote.
cd bash
git commit -a -m "Update Bash"
git push origin master
scp bash/init/remote.sh as_tacc@stampede2.tacc.utexas.edu:/work2/07752/as_tacc/Desktop/PlasticPET/bash/init/remote.sh
ssh -X  -t -t as_tacc@stampede2.tacc.utexas.edu "bash source /work2/07752/as_tacc/Desktop/PlasticPET/bash/init/remote.sh & xterm ; fg"