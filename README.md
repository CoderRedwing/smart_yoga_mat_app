# Smart Yoga Mat App

## App Introduction

The **Smart Yoga Mat App** connects your phone to a smart yoga mat via **Bluetooth** or **Wi-Fi**. The app allows users to control mat functions like **Warm-Up** and **Relaxation Mode**, play relaxing sounds (breathing exercises, ocean waves, ambient music), and update the mat’s firmware via **OTA** updates. Built with **Flutter**, it ensures compatibility across both **iOS** and **Android** platforms.

## Technology Stack

- **Framework**: [Flutter](https://flutter.dev)
- **Backend**: [Firebase](https://firebase.google.com)
- **Database**: [Firebase Firestore](https://firebase.google.com/docs/firestore)
- **Bluetooth/Wi-Fi Connectivity**: Native mobile APIs
- **OTA Updates**: Simulated via Firebase

## Dependencies

- `flutter`
- `firebase_core`
- `firebase_auth`
- `cloud_firestore`
- `audioplayers`
- `flutter_blue`
- `http`

### Install dependencies
```bash
flutter pub get
```

## How to Get Started

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/smart-yoga-mat-app.git
```

### 2. Install Flutter
Follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install).

### 3. Set Up Firebase
- Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
- Integrate Firebase for both Android and iOS as per the [FlutterFire setup guide](https://firebase.flutter.dev/docs/overview#installation).

### 4. Install Dependencies
```bash
cd smart-yoga-mat-app
flutter pub get
```

### 5. Run the App
```bash
flutter run
```
