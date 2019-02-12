#!/usr/bin bash
sudo apt-get update
sudo apt-get -y install sed
sudo apt-get -y install wget
sudo apt-get -y install cabextract
sudo apt-get -y install wine-stable
WINEARCH="win32" WINEPREFIX="$HOME/wine32" wine wineboot
wine --version
echo "Copy korean font file to wine"
cp "./font/gulim.ttf" "$HOME/.wine/drive_c/windows/Fonts"
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks -q --show-progress
echo "Winetricks download success!"
chmod 777 winetricks
./winetricks
echo "1. Select the default wineprefix CHECK!"
echo "2. Install a Windows DLL or component CHECK!"
echo "3. gdiplus, msxml6, riched30, wmp9 ALL CHECK!"
rm -r winetricks
echo "Kakaotalk install executable file download"
wget http://app.pc.kakao.com/talk/win32/KakaoTalk_Setup.exe -q --show-progress
echo "Kakaotalk download success!"
wine KakaoTalk_Setup.exe
