#!/bin/bash

# Author: Airat Halitov
# GitHub: https://github.com/AiratHalitov/airat-imagemagick
# License: GPLv3

# Скрипт уменьшает размер фотографий из папки source и накладывает водяной знак.
# Имена файлов сохранятся.

# Изменение качества в процентах:
QUALITY=85
# Изменение размера с сохранением пропорций (размер по ширине в пикселях):
SIZE=1024
# Имя файла водяного знака (без пробелов):
WATER=water.png
# Имя папки с исходными изображениями
SOURCE=images

# Создаем папки для результатов
mkdir result-small -p
mkdir result-water -p

# Уменьшаем размер и качество изображений и сохраняем в папку result-small
# Имена файлов и пропорции сохранятся.
if [ -d $SOURCE ]; then
    cd $SOURCE
    for f in *.*; do
        convert "$f" -resize $SIZE -quality $QUALITY ../result-small/"$f"
    done
    cd ..
else
    echo "There is no $SOURCE folder with source images!"
    exit 1
fi

# Накладываем водяной знак на фотки и сохраняем в папку result-water
# Водяной знак подготовить заранее и положить в корень папки
# Имя файла водяного знака должно быть water.png
if [ -f "$WATER" ]; then
    cd result-small
    for f in *.*; do
        composite -gravity center ../"$WATER" "$f" ../result-water/"$f"
    done
    echo "Done!"
else
    echo "There is no $WATER file!"
    exit 2
fi
