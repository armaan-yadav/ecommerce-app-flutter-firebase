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
    apiKey: 'AIzaSyAKSkYJmx3YIE5VGhCtO8u3SjKrQtkilUo',
    appId: '1:419723653858:web:bbb57cee8225fa137da4bb',
    messagingSenderId: '419723653858',
    projectId: 'news-6edf8',
    authDomain: 'news-6edf8.firebaseapp.com',
    storageBucket: 'news-6edf8.appspot.com',
    measurementId: 'G-HRC9PDD3H7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCloP5-4skRzs3BigsgkEQrwC5FKMp2rG4',
    appId: '1:419723653858:android:7969ed826b8cf0e87da4bb',
    messagingSenderId: '419723653858',
    projectId: 'news-6edf8',
    storageBucket: 'news-6edf8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8FieZFmROYEzEPBGO4HBb9n6ciatNAsI',
    appId: '1:419723653858:ios:e9c94c1ad354867e7da4bb',
    messagingSenderId: '419723653858',
    projectId: 'news-6edf8',
    storageBucket: 'news-6edf8.appspot.com',
    iosBundleId: 'com.example.newApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8FieZFmROYEzEPBGO4HBb9n6ciatNAsI',
    appId: '1:419723653858:ios:e9c94c1ad354867e7da4bb',
    messagingSenderId: '419723653858',
    projectId: 'news-6edf8',
    storageBucket: 'news-6edf8.appspot.com',
    iosBundleId: 'com.example.newApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAKSkYJmx3YIE5VGhCtO8u3SjKrQtkilUo',
    appId: '1:419723653858:web:fd3d4da8d41a7bb17da4bb',
    messagingSenderId: '419723653858',
    projectId: 'news-6edf8',
    authDomain: 'news-6edf8.firebaseapp.com',
    storageBucket: 'news-6edf8.appspot.com',
    measurementId: 'G-CTLEBY80FQ',
  );
}