# bash script
#
cd $bashdir/../plot/current
touch info.txt
echo \
"This file contains generated information about this run. Commands follow." \
"Do not edit." \
'\n\n' \
"${args}" \
> info.txt
#cat "${args}" >> info.txt