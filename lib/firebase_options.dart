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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB6774Io2JumfIRHLeJEMOhkcncJz13eSs',
    appId: '1:891499602896:web:032b100d554a8bcdf68fd5',
    messagingSenderId: '891499602896',
    projectId: 'yoalabo-444fe',
    authDomain: 'yoalabo-444fe.firebaseapp.com',
    storageBucket: 'yoalabo-444fe.appspot.com',
    measurementId: 'G-MQYX1PH822',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwvVx5WpC9jn0KyNmbH6FEi-5tFZ9aiqY',
    appId: '1:891499602896:android:6535ffd221064965f68fd5',
    messagingSenderId: '891499602896',
    projectId: 'yoalabo-444fe',
    storageBucket: 'yoalabo-444fe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZrfJLxFT9LfGAACdVA7VTMXjFxWVz9XU',
    appId: '1:891499602896:ios:f479af1c6575124cf68fd5',
    messagingSenderId: '891499602896',
    projectId: 'yoalabo-444fe',
    storageBucket: 'yoalabo-444fe.appspot.com',
    iosClientId: '891499602896-vgpgb3379eei18qhlmrosd2a85ji9q89.apps.googleusercontent.com',
    iosBundleId: 'n',
  );
}
