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
    apiKey: 'AIzaSyCIVN6C1PdFFQ4DNTt-3lCQ4FGWA45gVXI',
    appId: '1:781175945378:web:d6dd34cf64a9f5efd93ffb',
    messagingSenderId: '781175945378',
    projectId: 'final-year-project-e2c60',
    authDomain: 'final-year-project-e2c60.firebaseapp.com',
    storageBucket: 'final-year-project-e2c60.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCodyAoX9zhNZR8QxbOB-7nU2pE65v10lc',
    appId: '1:781175945378:android:e70812b7f4cac346d93ffb',
    messagingSenderId: '781175945378',
    projectId: 'final-year-project-e2c60',
    storageBucket: 'final-year-project-e2c60.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzHjlDEvEiSh4r-ZaIkUq3V1_ac4tXRTk',
    appId: '1:781175945378:ios:04b00bc49928dc1fd93ffb',
    messagingSenderId: '781175945378',
    projectId: 'final-year-project-e2c60',
    storageBucket: 'final-year-project-e2c60.appspot.com',
    iosBundleId: 'com.example.ecomeranceApp',
  );
}