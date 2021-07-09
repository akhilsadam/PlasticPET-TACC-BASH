read -r -a setup < $bashdir/setup.txt
RunName="${setup[0]}"
RunEvents="${setup[1]}"
RunMake="${setup[2]}"
#
name=${RunName}
mkdir ../data/$name
mv ../data/current/* ../data/$name
mkdir ../plot/$name
mv ../plot/current/* ../plot/$name