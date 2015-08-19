powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" <NUL

<nul set /p ".=;%ALLUSERSPROFILE%\chocolatey\bin" >> C:\Windows\Temp\PATH
set /p PATH=<C:\Windows\Temp\PATH
setx PATH "%PATH%" /m

:: Install all the things; for example:
cmd /c choco install 7zip -y
cmd /c choco install atom -y
cmd /c choco install linqpad -y
cmd /c choco install nodejs -y
cmd /c choco install googlechrome -y
cmd /c choco install virtuawin -y
cmd /c choco install visualstudio2015community -y
