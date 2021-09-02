export bashdir=$PWD
readarray -t cmds < $bashdir/commands.txt
nRuns="$(wc -l < $bashdir/commands.txt)"
echo "Number of Runs: $nRuns"
bash preRunAll.sh
for ((i=0;i<$nRuns;i++))
    do
        export Iteration=$i
        export argZ="${cmds[$i]}"
        export args="$(echo $argZ|tr -d '\r')"
        echo "Arguments: $args"
        echo "-------------RUN ITERATION/TOTAL: $i/$nRuns------------"
        bash preRun.sh
        bash Run.sh
        bash postRun.sh
done