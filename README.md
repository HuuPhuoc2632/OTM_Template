# app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
## Rename app
```
flutter pub run rename_app:main all="My App Name"
```
## Generate app logo launcher
```
Launcher Icon Generator: https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbk9xSXF5NnpqYlh3ajZ0OGFBR3JET1VyV3pvZ3xBQ3Jtc0ttM2FWTGRPVXBxai1kUDNfY0ZUZ0J3bUR1NkZQLThuLUI3QlhBc2RqT2p3TzM4MkxFX2h6T0VGSGpyb09obzhEakpNbzR2WUV2Tk5zUjNfdDl2bWxmeDhGdW9xaEFoZVhwX0JZbDNIMk9oZFNXV0ZYNA&q=https%3A%2F%2Fromannurik.github.io%2FAndroidAssetStudio%2Ficons-launcher.html&v=eMHbgIgJyUQ
flutter pub run flutter_launcher_icons:main
```
## Generate .g file command

```
flutter pub run build_runner build --delete-conflicting-outputs
```
## Configuring Flavors
```
link: https://odinachi.hashnode.dev/flavors-with-firebase-integration
link: https://ahmedyusuf.medium.com/setup-flavors-in-ios-flutter-with-different-firebase-config-43c4c4823e6b
```
## Build apk
fvm  flutter build  apk --no-tree-shake-icons
### TEST
```
DEV: flutter build  apk --flavor dev -t lib/main.dart --no-tree-shake-icons 
PROD: flutter build  apk  --flavor prod -t lib/main_prod.dart  --no-tree-shake-icons 
shorebird: shorebird release android --artifact apk --flavor prod -t lib/main_prod.dart  --no-tree-shake-icons 

```
### PROD
```
DEV: flutter build  apk --flavor dev -t lib/main.dart --release --no-tree-shake-icons 
PROD: flutter build  apk --flavor prod --release -t lib/main_prod.dart  --no-tree-shake-icons 
```

### RELEASE
```
PROD: flutter build appbundle --flavor prod --release -t lib/main_prod.dart  --no-tree-shake-icons 
shorebird: shorebird release android --flavor prod -t lib/main_prod.dart  --no-tree-shake-icons 
shorebird release ios --flavor prod -t lib/main_prod.dart  -- --no-tree-shake-icons 

```
### PATCH
```
shorebird patch ios --flavor prod -t lib/main_prod.dart  -- --no-tree-shake-icons 
shorebird patch android --flavor prod -t lib/main_prod.dart  -- --no-tree-shake-icons 

```


## Build Ios
```
cd ios
pod install
```

- open .envfile fille and edit name to correct environment file (example: .env.dev)
- open Runner.xcworkspace by Xcode
- open Runner -> Flutter folder -> Generated file
- Update **FLUTTER_TARGET, FLUTTER_BUILD_NAME, FLUTTER_BUILD_NUMBER**

#with M1 using

```
arch -x86_64 pod install
```
## Custome ThemeData
```
app use json_theme to custome themeData
web https://appainter.dev/
```

## Create config firebase
```
run dart pub global activate flutterfire_cli in your Flutter project
run flutterfire configure

Config env: https://blog.pirago.vn/flutter-build-with-flavor/
```