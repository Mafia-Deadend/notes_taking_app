Here's a comprehensive README file for your notes-taking app repository:

---

# Notes Taking App

![App Screenshot 1](https://github.com/Mafia-Deadend/notes_taking_app/assets/109336428/84296c6e-b43e-49fc-90b8-e46b1aa88cc9)
![App Screenshot 2](https://github.com/Mafia-Deadend/notes_taking_app/assets/109336428/2a04284a-a39d-48e6-8ec0-294700c874e9)

## Introduction

Welcome to the Notes Taking App! This is a simple, cross-platform application built with Flutter for managing your notes effortlessly. The app offers a user-friendly interface to create, update, and delete notes, ensuring your important information is always at your fingertips.

## Features

- **Cross-Platform**: Runs on both Android and iOS.
- **Simple UI**: Clean and intuitive user interface.
- **Persistent Storage**: Uses Hive for storing notes locally.

## Getting Started

### Prerequisites

Ensure you have the following installed on your machine:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) or [Xcode](https://developer.apple.com/xcode/)

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Mafia-Deadend/notes_taking_app.git
   cd notes_taking_app
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the app:**

   ```bash
   flutter run
   ```

## Project Structure

```plaintext
lib/
├── main.dart
├── Database/
│   └── database.dart
├── pages/
│   └── homepage.dart
└── utilities/
    ├── dialog_box.dart
    └── todo_tile.dart
```

- **main.dart**: Entry point of the application.
- **database.dart**: Handles the Hive database operations.
- **homepage.dart**: Main UI of the application.
- **dialog_box.dart**: Custom dialog box for adding new tasks.
- **todo_tile.dart**: Widget for displaying individual tasks.

## Usage

1. **Add a new task:**
   - Click on the floating action button to open the dialog box.
   - Enter the task details and save.

2. **Complete a task:**
   - Check the box next to the task to mark it as complete.

3. **Delete a task:**
   - Swipe the task tile to delete.

