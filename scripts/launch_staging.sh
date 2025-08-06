#!/bin/bash

echo "🚀 Launching RCLink in STAGING mode..."
echo "📱 App Name: RCLink (Staging)"
echo "🌐 Base URL: https://api-staging.rclink.my"
echo "📦 Bundle ID: com.rclink.rclink_app.staging"
echo ""

flutter run --flavor staging --target lib/main_staging.dart "$@" 