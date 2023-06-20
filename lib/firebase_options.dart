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
    apiKey: 'AIzaSyADli5pw3ycEevSl5rBAlnXAv7chI4t4BA',
    appId: '1:522878676397:web:44acd42a07f680d8cbc524',
    messagingSenderId: '522878676397',
    projectId: 'personal-recipe-assitant',
    authDomain: 'personal-recipe-assitant.firebaseapp.com',
    storageBucket: 'personal-recipe-assitant.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPiJKxKVgEaLVc2q98VRiAIzv9ioczugU',
    appId: '1:522878676397:android:db9805d331a27aaccbc524',
    messagingSenderId: '522878676397',
    projectId: 'personal-recipe-assitant',
    storageBucket: 'personal-recipe-assitant.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAS_XWZxXRIUiVDoA_6IXUbNh9eRFCqH7s',
    appId: '1:522878676397:ios:73ea1ba8b22ceb9bcbc524',
    messagingSenderId: '522878676397',
    projectId: 'personal-recipe-assitant',
    storageBucket: 'personal-recipe-assitant.appspot.com',
    iosClientId: '522878676397-jrho7u368n3njud1gj01vbftdgm6dre0.apps.googleusercontent.com',
    iosBundleId: 'com.example.personalrecipeassistant1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAS_XWZxXRIUiVDoA_6IXUbNh9eRFCqH7s',
    appId: '1:522878676397:ios:73ea1ba8b22ceb9bcbc524',
    messagingSenderId: '522878676397',
    projectId: 'personal-recipe-assitant',
    storageBucket: 'personal-recipe-assitant.appspot.com',
    iosClientId: '522878676397-jrho7u368n3njud1gj01vbftdgm6dre0.apps.googleusercontent.com',
    iosBundleId: 'com.example.personalrecipeassistant1',
  );
}
