#!/bin/bash

echo "🚀 Launching RCLink in DEVELOPMENT mode..."
echo "📱 App Name: RCLink (Dev)"
echo "🌐 Base URL: https://api-staging.rclink.my"
echo "📦 Bundle ID: com.rclink.rclink_app.dev"
echo ""

flutter run --flavor development --target lib/main_development.dart "$@" 