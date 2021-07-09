read -r -a setup < $bashdir/setup.txt
RunName="${setup[0]}"
RunEvents="${setup[1]}"
RunMake="${setup[2]}"
#
if [ ${RunMake} -gt 1 ]
then
    cd ../build
    cmake -DCMAKE_C_COMPILER=icc \
      -DCMAKE_CXX_COMPILER=icpc \
      -DCMAKE_PREFIX_PATH=$sharedir/geant4/geant4-install \
      ../src
    make clean
    make -j48
    echo "Made Simulation"
    cd B3a
else
    cd ../build/B3a
fi  
ls
echo $RunEvents
echo
echo run/beamOn > temp.txt
echo $RunEvents >> temp.txt
echo $(cat temp.txt) > temp.txt
./exampleB3a < temp.txt
echo "Completed Runs."
cd ../../analyze
python3 analyze.py
echo "Analyzed Data"
