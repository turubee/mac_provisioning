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
# Dockの表示アニメーションの時間を短縮
defaults write com.apple.dock autohide-time-modifier -float 0.5
# “自動的に非表示”をオン
defaults write com.apple.dock autohide -bool true

# Dock の再起動
killall Dock

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

# SystemUIServer の再起動
killall SystemUIServer

echo "👍 MacOS setting is done!"
