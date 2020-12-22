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

# Создаем папки для результатов
mkdir result-small -p
mkdir result-water -p
# Папка с исходными файлами (должна называться source)
cd source

# Уменьшаем размер изображений и сохраняем в папку result-small
# Имена файлов и пропорции сохранятся. Размер по ширине: 1024

for f in *.*; do
    convert "$f" -resize $SIZE -quality $QUALITY ../result-small/"$f"
done
cd ..

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
fi
