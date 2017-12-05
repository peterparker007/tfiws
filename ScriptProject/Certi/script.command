text1="PROVISIONING_PROFILE = \"\";"
replace1="PROVISIONING_PROFILE=\"fbb3501d-708c-4bfa-86d3-09847e6c25db\";"

text2="PROVISIONING_PROFILE_SPECIFIER = \"\";"
replace2="PROVISIONING_PROFILE_SPECIFIER=\"06July_Zaptech_Developer\";"

text3="DEVELOPMENT_TEAM = \"\";"
replace3="DEVELOPMENT_TEAM = \"3Y587YMRM5\";"

cd /Users/bhumesh/Music
sed -i "" "s/$text1/$replace1/g" project.pbxproj
sed -i "" "s/$text2/$replace2/g" project.pbxproj
sed -i "" "s/$text3/$replace3/g" project.pbxproj

