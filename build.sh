#!/bin/sh

PROJECT_NAME="XPodFramework"
SCHEME_NAME="XPodFramework"

# Build for iOS
xcodebuild -workspace ${PROJECT_NAME}.xcworkspace -scheme ${SCHEME_NAME} -destination 'generic/platform=iOS' -configuration Release -archivePath ./build/ios_arm64 archive SKIP_INSTALL=NO

# Build for iOS Simulator
xcodebuild -workspace ${PROJECT_NAME}.xcworkspace -scheme ${SCHEME_NAME} -destination 'generic/platform=iOS Simulator' -configuration Release -archivePath ./build/iossimulator archive SKIP_INSTALL=NO

# Build for Mac Catalyst
xcodebuild -workspace ${PROJECT_NAME}.xcworkspace -scheme ${SCHEME_NAME} -destination 'generic/platform=macOS,variant=Mac Catalyst' -configuration Release -archivePath ./build/maccatalyst archive SKIP_INSTALL=NO

# Create xcframework
xcodebuild -create-xcframework \
-framework ./build/ios_arm64.xcarchive/Products/Library/Frameworks/${PROJECT_NAME}.framework \
-framework ./build/iossimulator.xcarchive/Products/Library/Frameworks/${PROJECT_NAME}.framework \
-framework ./build/maccatalyst.xcarchive/Products/Library/Frameworks/${PROJECT_NAME}.framework \
-output ./build/${PROJECT_NAME}.xcframework



