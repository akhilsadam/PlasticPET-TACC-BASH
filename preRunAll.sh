# bash script
# set variables and save information   
echo "Name of Run:"
read
export RunName=${REPLY}
echo "Number of Events:"
read
export RunEvents=${REPLY}
# echo "Make necessary? Y/N = 2/0"
# read
# export RunMake=${REPLY}
export RunMake=2
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