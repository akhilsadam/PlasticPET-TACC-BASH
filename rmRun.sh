#bash
#remove run
echo "Name of Run to delete:"
read
name=${REPLY}
rm -r ../data/$name
rm -r ../plot/$name