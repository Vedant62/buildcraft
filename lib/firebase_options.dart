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
    apiKey: 'AIzaSyC0ovw6FH3b-b9dIiok-PbxYZkrHQJb0bo',
    appId: '1:956510080496:web:9cad602ac091894e74e135',
    messagingSenderId: '956510080496',
    projectId: 'buildcraft-6a87d',
    authDomain: 'buildcraft-6a87d.firebaseapp.com',
    storageBucket: 'buildcraft-6a87d.appspot.com',
    measurementId: 'G-TLCDVFTZT3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBN-Lvlyxnrp3WwCLTHMYpLReWguqQBD-A',
    appId: '1:956510080496:android:5f1f79baaca7eaf874e135',
    messagingSenderId: '956510080496',
    projectId: 'buildcraft-6a87d',
    storageBucket: 'buildcraft-6a87d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNSVyc1CN1Wwgf-o2gqHSf3RVRr5nBO3I',
    appId: '1:956510080496:ios:20237cbee62fc4eb74e135',
    messagingSenderId: '956510080496',
    projectId: 'buildcraft-6a87d',
    storageBucket: 'buildcraft-6a87d.appspot.com',
    iosBundleId: 'com.example.buildcraft',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNSVyc1CN1Wwgf-o2gqHSf3RVRr5nBO3I',
    appId: '1:956510080496:ios:20237cbee62fc4eb74e135',
    messagingSenderId: '956510080496',
    projectId: 'buildcraft-6a87d',
    storageBucket: 'buildcraft-6a87d.appspot.com',
    iosBundleId: 'com.example.buildcraft',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC0ovw6FH3b-b9dIiok-PbxYZkrHQJb0bo',
    appId: '1:956510080496:web:da14a6eecfa7e9c974e135',
    messagingSenderId: '956510080496',
    projectId: 'buildcraft-6a87d',
    authDomain: 'buildcraft-6a87d.firebaseapp.com',
    storageBucket: 'buildcraft-6a87d.appspot.com',
    measurementId: 'G-57Z61DVSHY',
  );
}