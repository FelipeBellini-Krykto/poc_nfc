#!/bin/bash

flavor="wide"

read -p "Qual flavor [wide, forbes, longevidade]: " flavor

cd ../base_app/ && \
cp ios/Runner/Firebase/$flavor-GoogleService-Info.plist ios/Runner/GoogleService-Info.plist && \
cp ios/Runner/Firebase/$flavor-firebase_app_id_file.json ios/firebase_app_id_file.json

echo "Termino da configuração do Firebase IOS - $flavor"
