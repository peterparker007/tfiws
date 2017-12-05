#sh script.command abc urapp 05Sept_Distribution_Profile.mobileprovision

if [ ! $# == 3 ]; then
echo -e "\033[1mPlease Provide sufficient parameters to Build an App.\033[0m "
exit
fi
TARGET="Demo"
CONFIGURATION="Debug"
SDK="iPhoneOS"
PROFILE_PATH="/Users/bhumesh/Desktop/Certi/05Sept_Distribution_Profile.mobileprovision"
IDENTITY="iPhone Distribution: Hemant Kumar (23UWNQL9Z2)"
KEYCHAIN="/Users/bhumesh/Desktop/Certi/ios_distribution.cer"
PASSWORD=""
security unlock-keychain -p "" ~/Library/Keychains/login.keychain
security import /Users/bhumesh/Desktop/Certi/ios_distribution.cer -k ~/Library/Keychains/login.keychain -P "" -T /usr/bin/codesign

#open "${PROFILE_PATH}"

#add Provisioning Profile to System
echo $#
cd /Users/bhumesh/Desktop/Certi/
#if [ ! $# == 3 ]; then
#echo "Please Provide sufficient parameter to Build an App."
#exit
#fi
mp=$3
uuid=`grep UUID -A1 -a  ${mp} | grep -io "[-A-Z0-9]\{36\}"`
echo "Found UUID $uuid"

output="/Users/bhumesh/Library/MobileDevice/Provisioning Profiles/$uuid.mobileprovision"

#mv ${mp} $uuid.mobileprovision

echo "copying to $output.."

cp -R  "/Users/bhumesh/Desktop/Certi/$mp" "$output"


#find PROVISIONING_PROFILE_SPECIFIER from File
read -d '' script << 'EOF'
BEGIN {
e = 1
pat = "<string>"tolower(provisioningProfile)

}
{
cur = tolower($0)

if (cur ~ pat && prev ~ /<key>name<\\/key>/) {
sub(/<string>/,"",cur)
sub(/<\\/string>/,"",cur)
print FILENAME cur
echo $cur
e = 0
}
if ($0 !~ /^\s*$/) {
prev = cur

}
}
END {
exit e
}
EOF

awk "$script" $3


sleep 5
osascript -e "tell application \"Xcode\" to quit"

cd /Users/bhumesh/Desktop/Projects
mkdir $1
cp -R  /Users/bhumesh/Desktop/DemoZAP /Users/bhumesh/Desktop/Projects/$1

text1="PROVISIONING_PROFILE = \"\";"
replace1="PROVISIONING_PROFILE=\"$uuid\";"

text2="PROVISIONING_PROFILE_SPECIFIER = \"\";"
replace2="PROVISIONING_PROFILE_SPECIFIER=\"$cur\";"

text3="DEVELOPMENT_TEAM = \"\";"
replace3="DEVELOPMENT_TEAM = \"3Y587YMRM5\";"


text4="\"CODE_SIGN_IDENTITY[sdk=iphoneos*]\" = \"iPhone Developer\";"
echo $text4
replace4="\"CODE_SIGN_IDENTITY[sdk=iphoneos*]\" = \"iPhone Distribution\";"
echo $replace4

text4="iPhone Developer"
replace4="iPhone Distribution"

cd /Users/bhumesh/Desktop/Projects/$1/DemoZAP/DemoZAP.xcodeproj
sed -i "" "s/$text1/$replace1/g" project.pbxproj
sed -i "" "s/$text2/$replace2/g" project.pbxproj
sed -i "" "s/$text3/$replace3/g" project.pbxproj
sed -i "" "s/$text4/$replace4/g" project.pbxproj

plutil -replace CFBundleName -string $2 /Users/bhumesh/Desktop/Projects/$1/DemoZAP/DemoZAP/info.plist

plutil -replace CFBundleName -string $2 /Users/bhumesh/Desktop/Projects/$1/DemoZAP/DemoZAP/info.plist

cd /Users/bhumesh/Desktop/Projects/$1/DemoZAP
xcodebuild -project DemoZAP.xcodeproj  build
cd   /Users/bhumesh/Desktop/Projects/$1/DemoZAP/build/Release-iphoneos/

mkdir Payload

cp -R DemoZAP.app /Users/bhumesh/Desktop/Projects/$1/DemoZAP/build/Release-iphoneos/Payload

zip -r Payload.zip Payload
cd /Users/bhumesh/Desktop/Projects/$1/
mkdir ipaFile

mv /Users/bhumesh/Desktop/Projects/$1/DemoZAP/build/Release-iphoneos/Payload.zip /Users/bhumesh/Desktop/Projects/$1/ipaFile/Payload.ipa

