# bash script for setting up utklshare (shared folder across the UTKL Group's TACC allocation)
chmod g+X $STOCKYARD
cd $STOCKYARD; mkdir utklshare
groups as_tacc
# use group name in next line
chgrp -R G-821490 utklshare
chmod g+s utklshare
set umask 027
chmod -R g+rwX utklshare