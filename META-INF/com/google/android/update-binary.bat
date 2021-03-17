@echo off
if exist update-binary del /q update-binary
wget -q --show-progress https://raw.githubusercontent.com/topjohnwu/Magisk/master/scripts/module_installer.sh -O update-binary