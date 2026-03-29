#!/bin/bash
set -e

BINARY="src-tauri/target/release/rewritebox-desktop"
ICON="src-tauri/icons/icon.png"
DESKTOP="com.rewritebox.app.desktop"

if [ ! -f "$BINARY" ]; then
  echo "Бинарник не найден. Сначала запусти: bun run build"
  exit 1
fi

mkdir -p ~/.local/bin
mkdir -p ~/.local/share/applications
mkdir -p ~/.local/share/icons/hicolor/256x256/apps

cp "$BINARY" ~/.local/bin/rewritebox-desktop
chmod +x ~/.local/bin/rewritebox-desktop

cp "$ICON" ~/.local/share/icons/hicolor/256x256/apps/rewritebox.png

sed "s|Exec=rewritebox-desktop|Exec=$HOME/.local/bin/rewritebox-desktop|" "$DESKTOP" \
  > ~/.local/share/applications/com.rewritebox.app.desktop

echo "RewriteBox установлен:"
echo "  Бинарник: ~/.local/bin/rewritebox-desktop"
echo "  Иконка:   ~/.local/share/icons/hicolor/256x256/apps/rewritebox.png"
echo "  Desktop:  ~/.local/share/applications/com.rewritebox.app.desktop"
echo ""
echo "Убедись что ~/.local/bin есть в PATH."
