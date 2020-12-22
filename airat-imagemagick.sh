#!/bin/bash

# Author: Airat Halitov
# GitHub: https://github.com/AiratHalitov/airat-imagemagick
# License: GPLv3

# Скрипт уменьшает размер фотографий из папки source и накладывает водяной знак.
# Имена файлов сохранятся. 

# Создаем папки для результатов
mkdir result-small -p
mkdir result-water -p

# Папка с исходными файлами (должна называться source)
cd source

# Уменьшаем размер изображений и сохраняем в папку result-small
# Имена файлов и пропорции сохранятся. Размер по ширине: 1024
# Изменение качества в процентах: (-quality 85)

for f in *.*; do
    convert "$f" -resize 1024 -quality 85 ../result-small/"$f"
done
cd ..

# Накладываем водяной знак на фотки и сохраняем в папку result-water
# Водяной знак подготовить заранее и положить в корень папки
# Имя файла водяного знака должно быть water.png

if [ -f water.png ]; then
    cd result-small
    for f in *.*; do
        composite -gravity center ../water.png "$f" ../result-water/"$f"
    done
fi
echo "Done!"
