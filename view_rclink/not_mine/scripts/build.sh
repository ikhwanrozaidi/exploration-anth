#!/bin/bash

# RCLink App Build Script
# Usage: ./scripts/build.sh [staging|production] [android|ios|both] [--upload]

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Firebase App IDs
STAGING_ANDROID_APP_ID="1:391019583758:android:394f6a4b2f56dcc103df5f"
STAGING_IOS_APP_ID="YOUR_STAGING_IOS_APP_ID"  # TODO: Add when iOS app is registered
PRODUCTION_ANDROID_APP_ID="YOUR_PRODUCTION_ANDROID_APP_ID"  # TODO: Add when production is set up
PRODUCTION_IOS_APP_ID="YOUR_PRODUCTION_IOS_APP_ID"  # TODO: Add when iOS app is registered

# Check arguments
if [ $# -lt 2 ]; then
    echo -e "${RED}Usage: $0 [staging|production] [android|ios|both] [--upload]${NC}"
    echo ""
    echo "Examples:"
    echo "  $0 staging android                    # Build only"
    echo "  $0 staging android --upload           # Build and upload to Firebase"
    echo "  $0 production ios --upload            # Build production iOS and upload"
    echo "  $0 staging both --upload              # Build both platforms and upload"
    exit 1
fi

FLAVOR=$1
PLATFORM=$2
UPLOAD_FLAG=$3

# Validate flavor
if [ "$FLAVOR" != "staging" ] && [ "$FLAVOR" != "production" ]; then
    echo -e "${RED}Error: Flavor must be 'staging' or 'production'${NC}"
    exit 1
fi

# Validate platform
if [ "$PLATFORM" != "android" ] && [ "$PLATFORM" != "ios" ] && [ "$PLATFORM" != "both" ]; then
    echo -e "${RED}Error: Platform must be 'android', 'ios', or 'both'${NC}"
    exit 1
fi

# Check upload flag
SHOULD_UPLOAD=false
if [ "$UPLOAD_FLAG" = "--upload" ]; then
    SHOULD_UPLOAD=true
    echo -e "${BLUE}ℹ️  Upload to Firebase enabled${NC}"
fi

echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}RCLink Build Script${NC}"
echo -e "${GREEN}================================${NC}"
echo -e "${YELLOW}Flavor:${NC} $FLAVOR"
echo -e "${YELLOW}Platform:${NC} $PLATFORM"
echo -e "${YELLOW}Upload:${NC} $SHOULD_UPLOAD"
echo ""

# Function to build Android
build_android() {
    echo -e "${GREEN}Building Android APK for $FLAVOR...${NC}"
    flutter build apk --flavor $FLAVOR --release

    echo ""
    echo -e "${GREEN}✅ Android build complete!${NC}"
    echo -e "${YELLOW}Output:${NC} build/app/outputs/flutter-apk/app-$FLAVOR-release.apk"
}

# Function to build iOS
build_ios() {
    echo -e "${GREEN}Building iOS IPA for $FLAVOR...${NC}"
    flutter build ipa --flavor $FLAVOR --release

    echo ""
    echo -e "${GREEN}✅ iOS build complete!${NC}"
    echo -e "${YELLOW}Output:${NC} build/ios/ipa/rclink_app.ipa"
}

# Function to upload Android to Firebase
upload_android() {
    local app_id=""
    local tester_group="internal-tester"

    # Get the correct App ID based on flavor
    if [ "$FLAVOR" = "staging" ]; then
        app_id=$STAGING_ANDROID_APP_ID
    else
        app_id=$PRODUCTION_ANDROID_APP_ID
        tester_group="uat-testers"
    fi

    # Check if App ID is set
    if [[ $app_id == YOUR_* ]]; then
        echo -e "${RED}❌ Error: Firebase App ID not configured for $FLAVOR Android${NC}"
        echo -e "${YELLOW}Please update the App ID in scripts/build.sh${NC}"
        return 1
    fi

    echo ""
    echo -e "${BLUE}📤 Uploading Android APK to Firebase App Distribution...${NC}"

    # Prompt for release notes
    echo -e "${YELLOW}Enter release notes (or press Enter for default):${NC}"
    read -r release_notes

    if [ -z "$release_notes" ]; then
        release_notes="Build on $(date +%Y-%m-%d)"
    fi

    firebase appdistribution:distribute \
        build/app/outputs/flutter-apk/app-$FLAVOR-release.apk \
        --app "$app_id" \
        --groups "$tester_group" \
        --release-notes "$release_notes"

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Android APK uploaded successfully!${NC}"
    else
        echo -e "${RED}❌ Failed to upload Android APK${NC}"
        return 1
    fi
}

# Function to upload iOS to Firebase
upload_ios() {
    local app_id=""
    local tester_group="internal-tester"

    # Get the correct App ID based on flavor
    if [ "$FLAVOR" = "staging" ]; then
        app_id=$STAGING_IOS_APP_ID
    else
        app_id=$PRODUCTION_IOS_APP_ID
        tester_group="uat-testers"
    fi

    # Check if App ID is set
    if [[ $app_id == YOUR_* ]]; then
        echo -e "${RED}❌ Error: Firebase App ID not configured for $FLAVOR iOS${NC}"
        echo -e "${YELLOW}Please update the App ID in scripts/build.sh${NC}"
        return 1
    fi

    echo ""
    echo -e "${BLUE}📤 Uploading iOS IPA to Firebase App Distribution...${NC}"

    # Prompt for release notes
    echo -e "${YELLOW}Enter release notes (or press Enter for default):${NC}"
    read -r release_notes

    if [ -z "$release_notes" ]; then
        release_notes="Build on $(date +%Y-%m-%d)"
    fi

    firebase appdistribution:distribute \
        build/ios/ipa/rclink_app.ipa \
        --app "$app_id" \
        --groups "$tester_group" \
        --release-notes "$release_notes"

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ iOS IPA uploaded successfully!${NC}"
    else
        echo -e "${RED}❌ Failed to upload iOS IPA${NC}"
        return 1
    fi
}

# Execute builds
case $PLATFORM in
    android)
        build_android
        if [ "$SHOULD_UPLOAD" = true ]; then
            upload_android
        fi
        ;;
    ios)
        build_ios
        if [ "$SHOULD_UPLOAD" = true ]; then
            upload_ios
        fi
        ;;
    both)
        build_android
        echo ""
        build_ios

        if [ "$SHOULD_UPLOAD" = true ]; then
            upload_android
            upload_ios
        fi
        ;;
esac

echo ""
echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}Build Summary${NC}"
echo -e "${GREEN}================================${NC}"
echo -e "${YELLOW}Flavor:${NC} $FLAVOR"
echo -e "${YELLOW}Platform:${NC} $PLATFORM"
echo -e "${YELLOW}Upload:${NC} $SHOULD_UPLOAD"
echo -e "${YELLOW}Status:${NC} ${GREEN}SUCCESS${NC}"

if [ "$SHOULD_UPLOAD" = false ]; then
    echo ""
    echo -e "${YELLOW}💡 Tip: Add --upload flag to automatically upload to Firebase${NC}"
    echo -e "${YELLOW}Example: $0 $FLAVOR $PLATFORM --upload${NC}"
fi

echo ""
echo -e "${GREEN}Done!${NC}"
