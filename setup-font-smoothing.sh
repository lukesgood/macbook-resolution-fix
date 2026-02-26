#!/bin/bash

# macOS 폰트 스무딩 설정 (non-Retina 디스플레이용)

# 서브픽셀 안티앨리어싱 활성화
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO

# 폰트 스무딩 레벨 설정 (0-3, 2=중간)
defaults write -g AppleFontSmoothing -int 2
defaults -currentHost write -globalDomain AppleFontSmoothing -int 2

echo "폰트 스무딩 설정이 완료되었습니다."
echo "재부팅 후 적용됩니다."
