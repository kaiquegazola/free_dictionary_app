# Free Dictionary App

A modern, user-friendly dictionary application built with Flutter that helps you look up words and their definitions quickly and easily.

## Features

- 📚 Browse through a list of words
- ⭐ Save your favorite words for quick access
- 📜 View your history
- 🌐 Support for multiple languages (currently English and Portuguese)
- 📱 Responsive design that works on all screen sizes

## Preview

<div align="center">
  <video src="https://github.com/kaiquegazola/free_dictionary_app/usage.webm" width="300" />
</div>

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Android Studio / VS Code with Flutter extensions
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/kaiquegazola/free_dictionary_app.git
```

2. Navigate to the project directory:
```bash
cd free_dictionary_app
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── di/                 # Dependency injection
├── domain/            # Domain layer (entities, repositories interfaces)
├── l10n/              # Localization files
├── router/            # App routing
├── screens/           # UI screens
│   ├── details/       # Word details screen
│   ├── favorites/     # Favorites screen
│   ├── history/       # History screen
│   ├── home/          # Home screen
│   └── main/          # Main screen
└── widgets/           # Reusable widgets
```

## Architecture

The app follows a clean architecture approach with the following layers:

- **Presentation Layer**: Contains all UI-related code (screens, widgets)
- **Domain Layer**: Contains business logic and entities
- **Data Layer**: Handles data operations and API calls

## Dependencies

- [flutter_mobx](https://pub.dev/packages/flutter_mobx) - State management
- [go_router](https://pub.dev/packages/go_router) - Routing
- [get_it](https://pub.dev/packages/get_it) - Dependency injection
- [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter) - Icons
- [gap](https://pub.dev/packages/gap) - Layout utilities

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Free Dictionary API](https://dictionaryapi.dev/) for providing the dictionary data
