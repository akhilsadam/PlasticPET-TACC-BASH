# bash script
# set variables and save information   
echo "Name of Run:"
read
export RunName=${REPLY}
echo "Number of Events:"
read
export RunEvents=${REPLY}
echo "Make necessary? Y/N = 2/0"
read
export RunMake=${REPLY}
cd ../plot/current
#
#
touch $bashdir/setup.txt
declare -a setup
setup[0]=$RunName
setup[1]=$RunEvents
setup[2]=$RunMake
echo "${setup[@]}" > $bashdir/setup.txt
#
#
touch info.txt
echo \
"This file contains generated information about this run. Commands follow." \
"Do not edit." \
"\n\n" \
> info.txt
cat ../../bash/commands.txt >> info.txt