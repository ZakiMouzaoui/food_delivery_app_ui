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
    apiKey: 'AIzaSyBW-hKWMVHrFZAATWGgynOOf9Mortc4Gok',
    appId: '1:765994754193:web:e9575674618b6538101f30',
    messagingSenderId: '765994754193',
    projectId: 'flutter-ecommerce-f87d1',
    authDomain: 'flutter-ecommerce-f87d1.firebaseapp.com',
    storageBucket: 'flutter-ecommerce-f87d1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDdWM7_T9iM8ASDxRu8WX00e_RkUrcp_dw',
    appId: '1:765994754193:android:475095fc1edb7ab9101f30',
    messagingSenderId: '765994754193',
    projectId: 'flutter-ecommerce-f87d1',
    storageBucket: 'flutter-ecommerce-f87d1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfGqc6lLLgqkdBGi3xSL7NcN6wOF2iM8w',
    appId: '1:765994754193:ios:64827c2584caede7101f30',
    messagingSenderId: '765994754193',
    projectId: 'flutter-ecommerce-f87d1',
    storageBucket: 'flutter-ecommerce-f87d1.appspot.com',
    androidClientId: '765994754193-fc031m8g4m7fp5ktc3fg0maaf5theuv1.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodDeliveryAppUi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBfGqc6lLLgqkdBGi3xSL7NcN6wOF2iM8w',
    appId: '1:765994754193:ios:404f24759ebaf4b4101f30',
    messagingSenderId: '765994754193',
    projectId: 'flutter-ecommerce-f87d1',
    storageBucket: 'flutter-ecommerce-f87d1.appspot.com',
    androidClientId: '765994754193-fc031m8g4m7fp5ktc3fg0maaf5theuv1.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodDeliveryAppUi.RunnerTests',
  );
}
