#!/bin/bash

echo "🚀 Launching RCLink in PRODUCTION mode..."
echo "📱 App Name: RCLink"
echo "🌐 Base URL: https://api.rclink.my"
echo "📦 Bundle ID: com.rclink.rclink_app"
echo ""

flutter run --flavor production --target lib/main_production.dart "$@" 