#!/usr/bin/env sh

# projeyi refresh eder

# chmod +r run.sh
# ./run.sh for run
rm ./ios/podfile.lock
flutter clean
flutter pub get
#flutter pub upgrade
cd ./ios/
pod cache clean --all
Pod clean
pod deintegrate
sudo gem install cocoapods-deintegrate cocoapods-clean
sudo arch -x86_64 gem install ffi
arch -x86_64 pod repo update
arch -x86_64 pod install
cd ..
