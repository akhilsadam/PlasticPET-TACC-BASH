read -r -a setup < $bashdir/setup.txt
RunName="${setup[0]}"
RunEvents="${setup[1]}"
RunMake="${setup[2]}"
#
if [ ${RunMake} -gt 1 ]
then
    cd $bashdir/../build
    make clean
    echo "make CXX_FLAGS=${args} -j8"
    make CXX_FLAGS="${args}" -j8
    echo "Made Simulation"
    cd B3a
else
    cd $bashdir/../build/B3a
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
python3 analyzeKNN.py
echo "Analyzed Data"