#!/bin/sh


cd /Users/bhumesh/Desktop/Certi/
if [ ! $# == 1 ]; then
echo "Usage: $0 (path/to/mobileprovision)"
exit
fi

mp=$1

uuid=`grep UUID -A1 -a  ${mp} | grep -io "[-A-Z0-9]\{36\}"`
Name=`grep Name -A1 -a  ${mp} | grep -io "[-A-Z0-9-a-z]\{36\}"`
echo "Found Name $Name"
echo "Found UUID $uuid"

output="/Users/bhumesh/Library/MobileDevice/Provisioning Profiles/$uuid.mobileprovision"

#mv ${mp} $uuid.mobileprovision

echo "copying to $output.."

cp -R  /Users/bhumesh/Desktop/Certi/05Sept_Distribution_Profile.mobileprovision "$output"
echo "done"
