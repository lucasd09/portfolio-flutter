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
        return ios;
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
    apiKey: 'AIzaSyAJtgIiGEWvr2ZHTAZhEMJOCWPk2wIy_-8',
    appId: '1:296127165204:web:e8b3b5d85c8cc022de0801',
    messagingSenderId: '296127165204',
    projectId: 'portfolio-flutter-378c9',
    authDomain: 'portfolio-flutter-378c9.firebaseapp.com',
    storageBucket: 'portfolio-flutter-378c9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCosBiz6IEu0a75hNkI7CjBJBWCVPI6cS8',
    appId: '1:296127165204:android:9147d66345ba9ca2de0801',
    messagingSenderId: '296127165204',
    projectId: 'portfolio-flutter-378c9',
    storageBucket: 'portfolio-flutter-378c9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDknH5LsJ6iVArFWkc-6AcsO2tvlnTCn5E',
    appId: '1:296127165204:ios:a8c2bb49c8b884d2de0801',
    messagingSenderId: '296127165204',
    projectId: 'portfolio-flutter-378c9',
    storageBucket: 'portfolio-flutter-378c9.appspot.com',
    iosClientId: '296127165204-uibuoj9pgrq56attqdpne6qi2483htn4.apps.googleusercontent.com',
    iosBundleId: 'com.example.portfolio',
  );
}
