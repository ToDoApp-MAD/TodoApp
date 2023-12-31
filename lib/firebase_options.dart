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
        return macos;
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
    apiKey: 'AIzaSyDMsTzJUZVujHWV-Ezb1AJzm3ZhYRr77vo',
    appId: '1:89099541224:web:356b725f047a27ed38875d',
    messagingSenderId: '89099541224',
    projectId: 'todoappmad',
    authDomain: 'todoappmad.firebaseapp.com',
    storageBucket: 'todoappmad.appspot.com',
    measurementId: 'G-8W73MTSS1N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrXieev1QTkFTNyz9H0XRmWBIiX7s_Rxo',
    appId: '1:89099541224:android:ea42c27354e9d14e38875d',
    messagingSenderId: '89099541224',
    projectId: 'todoappmad',
    storageBucket: 'todoappmad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYj35nIBA_1w1loMxkX2ODYm5mC_ZvgDs',
    appId: '1:89099541224:ios:121413f0b088a20538875d',
    messagingSenderId: '89099541224',
    projectId: 'todoappmad',
    storageBucket: 'todoappmad.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDYj35nIBA_1w1loMxkX2ODYm5mC_ZvgDs',
    appId: '1:89099541224:ios:e371a56fb5a3602138875d',
    messagingSenderId: '89099541224',
    projectId: 'todoappmad',
    storageBucket: 'todoappmad.appspot.com',
    iosBundleId: 'com.example.todoApp.RunnerTests',
  );
}
