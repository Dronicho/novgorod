## Реализованный функционал
 * Просмотр всех существующих меток
 * Добавление своих меток
 * Создание маршрутов с неограниченный количеством мест
 * Просмотр маршрутов
 * Прохождение маршрута:
    * Просмотр информации о текущем месте в маршруте
    * Прослушивание описания объектов с помощью Text-To-Speech
 * Поиск интересующих мест
 * Профиль с достижениями, уровнем и опытом

## Особенность проекта в следующем:
 * Геймификация
 * Подбор индвидуальных маршрутов 

## Технологический стек
 * Flutter + Bloc
 * Firebase storage
 * Google Maps API

# Getting Started
> Протестированно на Flutter 2.2.3 <br>
> Для работы необходим Android SDK >= 21 <br>
> Не работает на IOS симуляторе

Устанавливанием [Flutter](https://flutter.dev/docs/get-started/install)
Далее
```
git clone https://github.com/Dronicho/novgorod.git
cd novgorod
flutter pub get
```

> Для работы необходим Android device/emulator с Google сервисами

После подключения устройства

### Debug Build
```
flutter run
```

### Release Build
```
flutter build apk --split-per-abi
flutter install
```
