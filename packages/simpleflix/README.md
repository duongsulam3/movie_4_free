<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Development

### Pigeon (MethodChannel Generation)

This package uses [Pigeon](https://pub.dev/packages/pigeon) to generate type-safe MethodChannel code for communication between Dart and Native (Android/iOS).

If you modify `pigeons/messages.dart`, you must regenerate the bridge code by running:

```bash
dart run pigeon --input pigeons/messages.dart
```

This will update:
- `lib/src/internal/messages.g.dart`
- `android/src/main/kotlin/com/custom/simpleflix/Messages.g.kt`
- `ios/Classes/Messages.g.swift`

