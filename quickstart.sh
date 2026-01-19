#!/bin/bash
# Quick start script for PostureX

echo "🚀 PostureX - Quick Start"
echo "=========================="
echo ""

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed"
    echo "   Download: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js $(node --version)"
echo "✅ npm $(npm --version)"
echo ""

# Choose app to start
echo "Select which app to start:"
echo "1) Web App (React)"
echo "2) Mobile App (React Native)"
echo ""
read -p "Enter choice (1 or 2): " choice

if [ "$choice" = "1" ]; then
    echo ""
    echo "Starting Web App..."
    echo "📖 Open your browser to: http://localhost:3000"
    echo ""
    cd web
    npm install
    npm start

elif [ "$choice" = "2" ]; then
    echo ""
    echo "Starting Mobile App..."
    echo "📱 Scan QR code with Expo Go app"
    echo ""
    cd mobile
    npm install
    npx expo start

else
    echo "❌ Invalid choice"
    exit 1
fi
