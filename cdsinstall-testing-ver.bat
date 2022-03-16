@echo off
echo This is an auto installer for chrome, discord, and steam, intended for new computers
echo thanks for testing/using!
echo downloading chrome...
set c2="chromesetup.exe"
powershell -Command "Invoke-WebRequest https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B49C7B06A-ED24-8EE1-AEE1-8258101B9958%7D%26lang%3Den%26browser%3D4%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe -OutFile %c2%
echo done!
timeout 3 /nobreak
echo downloading discord...
set d2=ren "latest@channel=stable&platform=win&arch=x86" discordsetup.exe
wget --quiet "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86"
%d2%
echo done!
timeout 3 /nobreak
echo downloading steam...
set s2="steamsetup.exe"
powershell -Command "Invoke-WebRequest https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe -OutFile %s2%"
echo done!
timeout 3 /nobreak
echo starting chrome installer...
echo chromesetup.exe (for testing)
timeout 3 /nobreak
echo starting discord installer...
echo discordsetup.exe (for testing)
timeout 3 /nobreak
echo starting steam installer...
echo steamsetup.exe (for testing)
timeout 3 /nobreak
echo now just do the setups and you're good to go!
echo only proceed once done with all setups,
set choice=
:choose
set /p choice="Clean files? (y/n)"
if '%choice%'=='y' goto yes
if '%choice%'=='n' goto no
echo "%choice%" is not valid, please try again.
goto choose
:yes
del /q chromesetup.exe discordsetup.exe steamsetup.exe
echo files cleaned up, can proceed in 3 seconds
timeout 3 /nobreak
pause
exit
:no
pause
exit