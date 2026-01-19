# Smart Library - Concept 2 Implementation

Smart Library is a next-generation book discovery and tracking application built with Flutter and Firebase. This implementation demonstrates core Firebase integration including Authentication, Cloud Firestore (Real-time), and Firebase Storage.

## Features

*   **Firebase Authentication**: Secure signup and login with email/password.
*   **Real-time Firestore Sync**: Instant updates for book discovery across all devices/tabs.
*   **Firebase Storage**: Support for uploading and displaying book cover images.
*   **Material 3 UI**: Clean and professional interface for a seamless user experience.

## Setup Instructions

1.  **Dependencies**:
    ```bash
    flutter pub get
    ```
2.  **Firebase Configuration**:
    *   Install FlutterFire CLI: `dart pub global activate flutterfire_cli`
    *   Run `flutterfire configure` and select your project.
    *   This will update `lib/firebase_options.dart` with your actual credentials.
3.  **Firestore & Storage**:
    *   Enable **Authentication** (Email/Password) in Firebase Console.
    *   Enable **Cloud Firestore** and **Firebase Storage**.
    *   Deploy the security rules provided in [FIREBASE_CONFIG.md](FIREBASE_CONFIG.md).
4.  **Run the App**:
    ```bash
    flutter run
    ```

## Case Study: "The To-Do App That Wouldn't Sync"

**The Problem**: A legacy To-Do app used local storage or infrequent polling to sync data. This led to "stale data" where users would mark a task complete on a laptop, but it would still appear active on their phone, causing confusion and double-work.

**Smart Library Solution (Mapping)**:
*   **Scalability**: By using Firebase Auth and Firestore, Smart Library offloads the heavy lifting of user management and database scaling to Google's infrastructure.
*   **Real-time Experience**: Using Firestore's `snapshots()`, Smart Library ensures that as soon as a book is added or reserved, every active user sees the change instantly. No refresh button required.
*   **Reliability**: Firebase provides robust offline persistence. If a user loses connection in the library stacks, their changes are cached locally and synced automatically once they are back online.

## Video Demo Script (3-5 Minutes)

| Time | Action | Description |
| :--- | :--- | :--- |
| **0:00-0:30** | Introduction | Brief overview of Smart Library "Concept 2" and its goals. |
| **0:30-1:15** | Auth Flow | Show Signup and Login process. Demonstrate error handling with an invalid email. |
| **1:15-2:30** | Real-time Demo | **Crucial**: Open the app on two devices (or a simulator and a browser). Add a book on one and show it appearing instantly on the other. |
| **2:30-3:30** | Image Upload | Pick an image from the gallery, upload it, and show the book appearing in the list with its new cover. |
| **3:30-4:00** | Conclusion | Summarize how Firebase integration enhances the scalability and reliability of the library system. |

## Folder Structure

```text
lib/
├── firebase_options.dart  # Firebase Configuration
├── main.dart             # App Entry & Navigation
├── services/             # Core Firebase Logic
│   ├── auth_service.dart
│   ├── firestore_service.dart
│   └── storage_service.dart
├── screens/              # UI Screens
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── signup_screen.dart
│   └── home/
│       ├── books_realtime_screen.dart
│       └── profile_screen.dart
└── widgets/              # Reusable UI Components
    └── book_item.dart
```
