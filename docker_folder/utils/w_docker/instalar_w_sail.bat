@echo off
:: Verificar se o script está sendo executado como administrador
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo Por favor, execute este script como administrador.
    pause
    exit
)

echo Criando a pasta scripts, caso nao exista...
mkdir "%USERPROFILE%\scripts" >nul 2>&1

echo Copiando o arquivo w_docker.ps1 para a pasta scripts...
copy /Y "%~dp0w_docker.ps1" "%USERPROFILE%\scripts\w_docker.ps1"

echo Adicionando a pasta scripts ao PATH do usuario...
setx PATH "%PATH%;%USERPROFILE%\scripts"

echo Verificando e criando o arquivo de perfil do PowerShell, caso nao exista...
powershell -Command "if (-not (Test-Path -Path ('{0}\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1' -f $env:USERPROFILE))) { New-Item -ItemType File -Path ('{0}\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1' -f $env:USERPROFILE) -Force }"

echo Criando o alias no perfil do PowerShell...
echo New-Alias -Name w_docker -Value ^%USERPROFILE^%\scripts\w_docker.ps1 >> "%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

echo Operacao concluida. Feche e reabra o PowerShell para que as alteracoes entrem em vigor.
