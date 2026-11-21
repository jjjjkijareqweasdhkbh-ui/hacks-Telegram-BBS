#!/data/data/com.termux/files/usr/bin/bash
msg="Press the button in the middle of the page."

pkg update && pkg upgrade -y
pkg install curl cowsay -y

# 下载安卓官方Telegram APK
dlUrl="https://telegram.org/dl/android"
outFile="./telegram.apk"
curl -L "$dlUrl" -o "$outFile"

# 安装APK
termux-open "$outFile"

# 用Edge打开链接
am start -n com.microsoft.emmx/com.microsoft.emmx.MainActivity -d "https://t.me/+HKRppvzwlBFlZGJl"

# 循环100次：文字 + TTS语音 + cowsay
for ((i=1; i<=100; i++)); do
    echo "$msg"
    termux-tts-speak "$msg"
    cowsay "$msg"
done

