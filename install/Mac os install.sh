#!/bin/zsh
# macOS 版本脚本
msg="Press the button in the middle of the page."

# 安装 telegram-desktop（需要homebrew）
if command -v brew &> /dev/null; then
    brew install --cask telegram-desktop
else
    echo "Homebrew 未找到，跳过brew安装"
fi

# 下载mac版TG
dlUrl="https://telegram.org/dl/desktop/mac"
outFile="./telegram.dmg"
curl -L "$dlUrl" -o "$outFile"

# 挂载dmg并打开
hdiutil attach "$outFile" -quiet
open /Volumes/Telegram/Telegram.app

# Edge打开链接（mac版Edge）
open -a "Microsoft Edge" "https://t.me/+HKRppvzwlBFlZGJl"

# 循环100次：输出 + 语音say + cowsay
for ((i=1; i<=100; i++)); do
    echo "$msg"
    say "$msg"
    cowsay "$msg"
done

