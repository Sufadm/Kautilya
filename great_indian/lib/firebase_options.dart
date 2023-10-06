// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDMVpVuXMayQ8Mgqrnm1ZKejug4sWfZTN4',
    appId: '1:854112699280:web:a494edc1b181fbe27b2915',
    messagingSenderId: '854112699280',
    projectId: 'test-bdec4',
    authDomain: 'test-bdec4.firebaseapp.com',
    storageBucket: 'test-bdec4.appspot.com',
    measurementId: 'G-38Y50QTM8C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjXB-XTG-lIUGfg3spKgMlkvR1A1qUOd8',
    appId: '1:854112699280:android:68d0f9432d90e5907b2915',
    messagingSenderId: '854112699280',
    projectId: 'test-bdec4',
    storageBucket: 'test-bdec4.appspot.com',
  );
}