#!/bin/sh

# --- Finder ---
# 隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles -bool true
# すべての拡張子のファイルを表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true
# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true
# 表示スタイルをリストに変更
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# ドライブをデスクトップに表示
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

# Finder の再起動
killall Finder

# ネットワークストレージに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# USBメモリに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# --- Dock ---
# “自動的に非表示”をオン
defaults write com.apple.dock autohide -bool true
# Dockのサイズ変更（16-128 / default 64）
defaults write com.apple.dock tilesize -int 48
# Dockの拡大を有効化
defaults write com.apple.dock magnification -bool true
# 拡大時の最大サイズを設定
defaults write com.apple.dock largesize -int 64
# Dockの表示アニメーションの時間を短縮
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Dock の再起動
killall Dock

dockutil --add "/Applications/Google Chrome.app"
dockutil --add "/Applications/Hyper.app"
dockutil --add "/Applications/Visual Studio Code.app"
dockutil --add "/Applications/Slack.app"
dockutil --add "/Applications/zoom.us.app"

# --- ControlCenter ---
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist WiFi -int 18
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Sound -int 18
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Display -int 18

# ControlCenter の再起動
killall ControlCenter

# --- SystemUIServer ---
# 時計で日付を表示（例：9月20日(木) 23:00）
defaults write com.apple.menuextra.clock DateFormat -string 'EEE MMM d HH:mm:ss'
# バッテリーの割合（%）を表示
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# スクリーンショットのドロップシャドウを付けない
defaults write com.apple.screencapture disable-shadow -bool true
# スクリーンショットの出力先の変更
mkdir -p ~/Pictures/ScreenShot
defaults write com.apple.screencapture location ~/Pictures/ScreenShot
# スクリーンショットのプレフィックス名変更
defaults write com.apple.screencapture name "ScreenShot"
# キーボードの鮮度を0に変更
defaults write com.apple.BezelServices kDim -float 0.0
# キーボードのバックライト自動オフまでの時間変更
defaults write com.apple.BezelServices kDimTime -int 5

# SystemUIServer の再起動
killall SystemUIServer

echo "👍 MacOS setting is done!"
