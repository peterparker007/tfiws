#!/bin/bash
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

echo $1
awk -v "provisioningProfile=$1" "$script" *
