#!/bin/bash

# Install Flutter if it doesn't exist
if [ ! -d "flutter" ]; then
  echo "Downloading Flutter SDK..."
  git clone https://github.com/flutter/flutter.git -b stable
fi

# Add Flutter to the PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Show Flutter version
echo "Flutter version:"
flutter --version

# Install dependencies
echo "Installing dependencies..."
flutter pub get

# Build the Web app
echo "Building Flutter Web app..."
flutter build web --release
