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
    apiKey: 'AIzaSyCIPir67PEwL5V4W_QOhmUjHwhcHp6iHdE',
    appId: '1:40542382673:web:ca608037d6bb18183d2670',
    messagingSenderId: '40542382673',
    projectId: 'fir-crud-57184',
    authDomain: 'fir-crud-57184.firebaseapp.com',
    storageBucket: 'fir-crud-57184.appspot.com',
    measurementId: 'G-CT653PXSE0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiSfomAX8gjZJWfUS8T_D5SPCJAGTzxV0',
    appId: '1:40542382673:android:6bdcb991843e15eb3d2670',
    messagingSenderId: '40542382673',
    projectId: 'fir-crud-57184',
    storageBucket: 'fir-crud-57184.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsTWUq7FoAY5ZDwGWen0MC4t8i7hDarGE',
    appId: '1:40542382673:ios:b5991e64f3059f693d2670',
    messagingSenderId: '40542382673',
    projectId: 'fir-crud-57184',
    storageBucket: 'fir-crud-57184.appspot.com',
    iosClientId: '40542382673-8d5vhp90apnvajh23c5ah6b1o8mn0mdk.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseCrud',
  );
}