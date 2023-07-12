# Bookpedia 📚

## Feature in The App
- 📙Create book by click on floating action button in homepage
- 📒 See list of books in homepage
- 📘See detail of each book by clicking on the book card in homepage
- 📗Update book by clicking on edit icon on the book card in homepage
- 📕Delete book by clicking on delete icon on the book card in homepage

### APK
[Bookpedia Apk]()

## About This App

### Flutter
This app is made with Flutter 3.10.5
```
  dart: ">=3.0.5 <4.0.0"
  flutter: ">=3.3.0"
```

### Setup

Clone project
```
git clone 
```

Get All Dependencies/Packages
```
flutter pub get
```

Generate `*.g.dart` files
```
flutter pub run build_runner build --delete-conflicting-outputs
```

## Run Project on Device/Emulator

### Debug
```
flutter run
```

### Release
```
flutter run --release
```

### Project structure in lib
    ├── core                    # Core files used generally in the app 
    │   ├── constants           # Const variables used in the app
    │   ├── design              # Design system of the app(atom, decoration, layout, style)
    │   └── router              # Router system of the app
    │   └── session             # Session manager used in the app
    ├── data                    # Data source call system of the app
    ├── di                      # Dependency Injection
    ├── domain                  # Base model and use case
    ├── feature                 # Feature of the app including the controller and ui