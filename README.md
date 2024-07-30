
# DayTasker

## Overview

**DayTasker** is a powerful and user-friendly to-do application built with Flutter. It helps users organize their daily tasks efficiently. Integrated with Firebase, DayTasker provides real-time data storage, robust authentication, and seamless user experience.

## Features

- **User Authentication**: Secure login and registration using Firebase Authentication.
- **Task Management**: Add, update, and delete tasks effortlessly.
- **Real-Time Sync**: All tasks are synced in real-time with Firebase Firestore.
- **Intuitive UI**: Clean and modern user interface built with Flutter.

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- [Firebase Account](https://firebase.google.com/)

### Installation

1. **Clone the repository**:

   ```sh
   git clone https://github.com/vihaantejavath/DayTasker.git
   cd DayTasker
   ```

2. **Install dependencies**:

   ```sh
   flutter pub get
   ```

3. **Set up Firebase**:

   - Create a new project in Firebase Console.
   - Add an Android and/or iOS app to your Firebase project.
   - Follow the instructions to download the `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) and place it in the appropriate directory.

4. **Run the app**:

   ```sh
   flutter run
   ```

## Firebase Integration

DayTasker uses FlutterFire to integrate Firebase services. Here's a brief overview of how Firebase is used in the project:

### Authentication

- **Sign Up**: New users can register using their email and password.
- **Sign In**: Existing users can log in using their credentials.
- **Sign Out**: Users can securely log out from their accounts.

### Firestore

- **Task Storage**: Each user's tasks are stored in a separate Firestore collection, ensuring data privacy and security.
- **Real-Time Updates**: Any changes made to the tasks are instantly reflected across all devices.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes. Ensure that your code adheres to the existing coding standards and include relevant tests.


## Acknowledgements

- [FlutterFire](https://firebase.flutter.dev/) for Firebase integration.
- [Flutter](https://flutter.dev/) for the amazing framework.

## Contact

If you have any questions or suggestions, feel free to contact me at [vihaantejavath@gmail.com].
