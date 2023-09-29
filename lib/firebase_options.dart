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
    apiKey: 'AIzaSyBaU3fqDowonA0UoZy3Uz9VcZPntoggVG0',
    appId: '1:371108091839:web:6e510ed45e404adef3730a',
    messagingSenderId: '371108091839',
    projectId: 'law-help-d64da',
    authDomain: 'law-help-d64da.firebaseapp.com',
    storageBucket: 'law-help-d64da.appspot.com',
    measurementId: 'G-DBCJDYM31C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBet6WxEQ2tHcK6XjM8Lrdjiy_zV4gWph8',
    appId: '1:371108091839:android:20c91bad385e1efff3730a',
    messagingSenderId: '371108091839',
    projectId: 'law-help-d64da',
    storageBucket: 'law-help-d64da.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCS6nOshCdV03r9pKAFMeDvAAcBtsUJ0lI',
    appId: '1:371108091839:ios:a6cbeb74ce3124aef3730a',
    messagingSenderId: '371108091839',
    projectId: 'law-help-d64da',
    storageBucket: 'law-help-d64da.appspot.com',
    iosBundleId: 'com.sunflower.lawHelp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCS6nOshCdV03r9pKAFMeDvAAcBtsUJ0lI',
    appId: '1:371108091839:ios:e9b418e987d9b782f3730a',
    messagingSenderId: '371108091839',
    projectId: 'law-help-d64da',
    storageBucket: 'law-help-d64da.appspot.com',
    iosBundleId: 'com.sunflower.lawHelp.RunnerTests',
  );
}
