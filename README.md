# airat-imagemagick
Скрипт для быстрого массового сжатия и наложения водяных знаков на изображения от Айрата Халитова

## Установка и запуск:
```bash
git clone https://github.com/AiratHalitov/airat-imagemagick

cd airat-imagemagick

./airat-imagemagick.sh
```

### Примечания:
- Скрипт работает с папкой `source`, исходные изображения нужно копировать в эту папку
- Перед запуском скрипта нужно установить пакет `imagemagick` (команда: `sudo apt install imagemagick`)
- Читай комментарии [скрипта](https://github.com/AiratHalitov/airat-imagemagick/blob/main/airat-imagemagick.sh) - там всё подробно описано (можно редактировать параметры)
- Небольшая шпаргалка с объяснениями махинаций с файлами находится [тут](http://www.uamedwed.com/blog/linux/imagemagick-ili-kak-szhimat-izobrazheniya-v-os-linux.html)
- Водяной знак подготовить заранее и положить в корень папки. Имя файла водяного знака должно быть `water.png` или прописать в переменную `WATER`
- `result-small` - папка с уменьшенными изображениями; `result-water` - итоговая папка уменьшенных изображений с водяными знаками

### Переменные:
- `QUALITY=85` - Изменение качества изображения в процентах
- `SIZE=1024` - Изменение размера с сохранением пропорций (размер по ширине в пикселях)
- `WATER=water.png` - Имя файла водяного знака (без пробелов)
