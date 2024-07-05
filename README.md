📚 GibiBOOK: A Social Media App for University Students

 🌟 Introduction

GibiBOOK is a mobile social media application designed to provide a user-friendly and engaging platform for university students. Leveraging the capabilities of the Flutter framework, GibiBOOK aims to offer core functionalities akin to existing social media platforms while maintaining simplicity and efficiency.

🎯 Goals

- 🌐 Develop a cross-platform mobile social media application using Flutter.
- 🧑‍💻 Implement features for creating and managing user profiles.
- 📸 Enable users to post pictures, like, and comment on each other's posts.
- 🗑️ Provide basic social media features like deleting posts and user accounts.
- 🔒 Implement security features such as account verification.

🤔 Why Flutter?

- **Cross-Platform Development**: Build a single codebase for both Android and iOS, saving time and resources.
- **Hot Reload**: Allows for instant visibility of changes, facilitating rapid development and iteration.
- **UI/UX Excellence**: Flutter excels in creating beautiful and expressive UIs with rich animations.
- **Ease of Use**: Dart, the language used in Flutter, is known for its readability and ease of learning.
- **Community Support**: Flutter has a large and active community, providing valuable support and resources.

🛠️ Technical Specifications

- **Development Framework**: Flutter
- **Programming Language**: Dart

🏗️ Architecture

GibiBOOK employs a modular architecture based on the principles of Clean Architecture, which divides the application into distinct layers, promoting separation of concerns and facilitating maintainability and scalability.

🏛️ Layers of GibiBOOK Architecture

1. **Presentation Layer**:
   - **Widgets**: Flutter widgets that form the UI components.
   - **State Management**: Use of Provider or Riverpod for managing the state of the application efficiently.
   - **UI Logic**: Handles UI-related logic and interactions.

2. **Domain Layer**:
   - **Entities**: Core objects that represent the fundamental business models, such as User and Post.
   - **Use Cases**: Business logic operations that are triggered by the Presentation layer and interact with the Data layer.

3. **Data Layer**:
   - **Repositories**: Abstract classes defining data operations.
   - **Data Sources**: Implementations of repositories using Firebase Firestore and Firebase Auth for network operations.
   - **Models**: Data models for mapping JSON responses to Dart objects.

4. **Dependency Injection**:
   - **Service Locator**: Utilization of packages like get_it for managing dependencies and ensuring decoupled classes.

📱 Functionality

🌟 Core Features

- **User Registration and Login**:
  - Secure authentication system to register new users and allow existing users to log in.
  - Firebase Authentication integration for secure user management.  

- **Profile Creation and Management**:
  - Users can create and manage their profiles, including setting a profile picture and adding basic information.
  - Profile data is stored and retrieved using Firebase Firestore.

- **Image Posting**:
  - Users can post images with captions to share moments with their peers.
  - Images are uploaded to Firebase Storage, and metadata is saved in Firestore.

- **Like and Comment System**:
  - Users can like and comment on each other's posts, fostering interaction and engagement.
  - Real-time updates using Firestore's snapshot listeners.

- **Post and Profile Editing**:
  - Users can edit their posts' captions and update their profile information as needed.
  - Changes are immediately reflected in the database and UI.

- **User Search Functionality**:
  - Enable users to search for other users within the app.
  - Implement search functionality using Firestore queries.


🏁 Conclusion

GibiBOOK aims to demonstrate the capabilities of Flutter in developing a modern social media application tailored for university students. By focusing on core functionalities and a user-friendly experience, GibiBOOK provides a valuable learning opportunity in mobile app development while catering to the growing demand for social interaction platforms. This project showcases the potential of Flutter for building efficient, beautiful, and cross-platform mobile applications, ensuring a robust and scalable architecture for future enhancements.

---

🚀 How to Set Up the Project

### Prerequisites

Before you begin, ensure you have met the following requirements:

- **Flutter SDK**: [Installation Guide](https://flutter.dev/docs/get-started/install)
- **Android Studio** or **VS Code** with Flutter and Dart plugins
- **Android Emulator** or a physical device for testing
- **Firebase Account** for backend services

## Installation

Follow these steps to set up the project locally:

1. **Clone the Repository**

    ```bash
    git clone https://github.com/asgerami/gibibooks.git
    cd GibiBooks
    ```

2. **Install Dependencies**

    ```bash
    flutter pub get
    ```

3. **Set Up Firebase**

    - Go to [Firebase Console](https://console.firebase.google.com/) and create a new project.
    - Add an Android app and an iOS app to your Firebase project.
    - Download the `google-services.json` file for Android and place it in the `android/app` directory.
    - Download the `GoogleService-Info.plist` file for iOS and place it in the `ios/Runner` directory.
    - Enable Firebase Authentication and Firestore in the Firebase console.

4. **Configure Android**

    - Open `android/app/build.gradle` and add the following under `dependencies`:

        ```gradle
        implementation 'com.google.firebase:firebase-analytics'
        implementation 'com.google.firebase:firebase-auth'
        implementation 'com.google.firebase:firebase-firestore'
        ```

    - Enable multidex support:

        ```gradle
        android {
            defaultConfig {
                multiDexEnabled true
            }
        }
        ```

5. **Configure iOS**

    - Open `ios/Runner/Info.plist` and add:

        ```xml
        <key>CFBundleURLTypes</key>
        <array>
            <dict>
                <key>CFBundleTypeRole</key>
                <string>Editor</string>
                <key>CFBundleURLName</key>
                <string>com.yourcompany.gibibooks</string>
                <key>CFBundleURLSchemes</key>
                <array>
                    <string>YOUR_REVERSED_CLIENT_ID</string>
                </array>
            </dict>
        </array>
        ```

    - Install CocoaPods dependencies:

        ```bash
        cd ios
        pod install
        cd ..
        ```

## Running the App

1. **Run on Android**

    - Ensure your Android emulator or device is connected and running.
    - Execute the following command:

        ```bash
        flutter run
        ```

2. **Run on iOS**

    - Ensure your iOS simulator or device is connected and running.
    - Execute the following command:

        ```bash
        flutter run
        ```

## Contributing

Contributions are always welcome! Here’s how you can help:

1. Fork the repository.
2. Create a new branch 
3. Make your changes.
4. Commit your changes
5. Push to the branch 
6. Open a Pull Request.
