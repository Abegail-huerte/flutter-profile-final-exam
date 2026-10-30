# Made by Abegail O. Huerte

A Flutter app with a bottom navigation bar and three screens:

- **Home**: a news feed built with a reusable `Newsfeedcomponent` and `ListView.builder`.
- **Notifications**: read and unread notifications with icons based on their type.
- **Profile**: a Facebook-style profile page. The app opens on this tab.

## Requirements

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (includes Dart)
- Google Chrome, an Android emulator, or a connected phone

Check your setup with:

```
flutter doctor
```

## How to open and run the app

1. Clone the project and go into the folder:
   ```
   git clone <repository-url>
   cd prelim_app
   ```
2. Download the packages:
   ```
   flutter pub get
   ```
3. Run the app:
   ```
   flutter run -d chrome
   ```
   You can also run `flutter devices` to list your devices and then `flutter run -d <device-id>`.
   In VS Code, open the folder and press **F5**.

While the app is running, press `r` to hot reload, `R` to hot restart and `q` to quit.

## Run the tests

```
flutter test
```

## Project structure

```
lib/
├── components/
│   ├── globalappbar_component.dart   # shared app bar
│   ├── newsfeedcomponent.dart        # one news feed post
│   └── notification_component.dart   # one notification row
├── screens/
│   ├── newsfeed_screen.dart
│   ├── notification_screen.dart
│   ├── profilescreen.dart
│   └── prelim.dart                   # prelim exam screen (not shown in the app)
└── main.dart                         # app entry and bottom navigation bar
assets/images/profile.png             # profile picture
```

## Troubleshooting

**`flutter` is not recognized**: Flutter is not on your PATH. Add the Flutter `bin` folder
(for example `C:\Users\<you>\dev\flutter\bin`) to your PATH, then reopen the terminal.
