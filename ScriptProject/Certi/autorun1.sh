#! /bin/bash


echo $1

xcodebuild \
CODE_SIGNING_REQUIRED=YES \
CODE_SIGN_IDENTITY="$DEVELOPER_NAME" \
PROVISIONING_PROFILE="$PROFILE_UUID" \
PRODUCT_BUNDLE_IDENTIFIER="com.zaptech.MyApp" \
-sdk iphoneos \

clean archive \
-archivePath "$ARCHIVE_PATH"
#-workspace "$XCODE_WORKSPACE" \

