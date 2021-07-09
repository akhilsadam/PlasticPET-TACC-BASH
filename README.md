If you are a member of the UTKL Group, please visit the install directory, which contains notes on how to setup ROOT and Geant4 for a complete group.
The other scripts are to do with logging in/out of TACC and running the PlasticPET simulation remotely.

In particular, the install/sourceAll.sh file will be identical to the sourceAll.sh in the shared directory.

Steps to use Geant4 (also in the install directory and in the sharedir):

1. Enter the "sharedir" mentioned in the sourceAll.sh: /work2/07752/as_tacc/utklshare/

2. Copy the commented lines to a notepad or bash script. (These lines are bracketed by the <<COMMENT and COMMENT symbols.)

3. Run this script in your build directory, replacing "directory to source" with your source code directory.

4. Once this is complete, run your compiled executable.


Last note: do not push to this repository, since the rest of this directory is subject to constant change - it is part of the PlasticPET simulation!