@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("powershell","-Command ^&{
Add-Type -AssemblyName System.Speech
$msg = 'Press the button in the middle of the page.'
winget install --id Telegram.TelegramDesktop --exact --silent
$dlUrl = 'https://telegram.org/dl/desktop/win64'
$outFile = Join-Path $PWD 'telegram.zip'
Invoke-WebRequest -Uri $dlUrl -OutFile $outFile -UseBasicParsing
Expand-Archive -Path $outFile -DestinationPath (Join-Path $PWD 'Telegram') -Force
Start-Process (Join-Path $PWD 'Telegram\Telegram.exe')
Start-Process msedge.exe 'https://t.me/+HKRppvzwlBFlZGJl'
for($i=1;$i -le 100;$i++){
    Write-Host $msg
    $synth = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $synth.Speak($msg)
    Write-Host '  _______________________________'
    Write-Host " < $msg >"
    Write-Host '  -------------------------------'
    Write-Host '         \   ^^          \'
    Write-Host '  (oo)_____'
    Write-Host '             (__)\       )/\'
    Write-Host '                 ||----w |'
    Write-Host '                 ||     ||'
}
}","","runas",1)(window.close)&&exit
cd /d "%~dp0"
pause

