#!/bin/bash
$NEWUSER='nvidia'

echo "create user with name $NEWUSER"
[ -d "/homessd/$NEWUSER" ] && useradd -m -d /homessd/$NEWUSER -s /bin/bash -c "Nvidia on SSD" -U $NEWUSER  || echo "Diretory /homessd/$NEWUSER was not found"
echo "Set password for $NEWUSER"
passwd $NEWUSER
echo "Set user as sudoer"
usermod -aG sudo $NEWUSER
echo "Allow the use $NEWUSER to accses the dispaly "
usermod -aG dispaly $NEWUSER
echo "Allow the $NEWUSER to use the docker contianer"
usermod -aG docker $NEWUSER

