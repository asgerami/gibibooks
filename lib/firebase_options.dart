// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA-mlhvX3sFmh2L9Y8o5JzwW9KBO48LhqY',
    appId: '1:194553155139:web:5d5f2ba7d99b0003db0ef6',
    messagingSenderId: '194553155139',
    projectId: 'gibibook-22974',
    authDomain: 'gibibook-22974.firebaseapp.com',
    storageBucket: 'gibibook-22974.appspot.com',
    measurementId: 'G-XNNBR6WDKR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-YMiGeEZ79C9Xz0EC9nzjQkDg9CElkmg',
    appId: '1:194553155139:android:ea9d2de622a5dcb6db0ef6',
    messagingSenderId: '194553155139',
    projectId: 'gibibook-22974',
    storageBucket: 'gibibook-22974.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-P4tRqqo016f701lg9e58gL5sryPJF44',
    appId: '1:194553155139:ios:13d2209f6c6a1265db0ef6',
    messagingSenderId: '194553155139',
    projectId: 'gibibook-22974',
    storageBucket: 'gibibook-22974.appspot.com',
    iosBundleId: 'com.example.gibibooks',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-P4tRqqo016f701lg9e58gL5sryPJF44',
    appId: '1:194553155139:ios:13d2209f6c6a1265db0ef6',
    messagingSenderId: '194553155139',
    projectId: 'gibibook-22974',
    storageBucket: 'gibibook-22974.appspot.com',
    iosBundleId: 'com.example.gibibooks',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA-mlhvX3sFmh2L9Y8o5JzwW9KBO48LhqY',
    appId: '1:194553155139:web:fd2cf3f85531a5e2db0ef6',
    messagingSenderId: '194553155139',
    projectId: 'gibibook-22974',
    authDomain: 'gibibook-22974.firebaseapp.com',
    storageBucket: 'gibibook-22974.appspot.com',
    measurementId: 'G-VB4MQ6HLBZ',
  );
}