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
    apiKey: 'AIzaSyBuxHKxeFD7UUnjMXksmpi8LBm2ich0J3E',
    appId: '1:482066476965:web:247f6bc7e235d4d758824c',
    messagingSenderId: '482066476965',
    projectId: 'chatydemo-cd567',
    authDomain: 'chatydemo-cd567.firebaseapp.com',
    storageBucket: 'chatydemo-cd567.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRAUbqnlf5DNbWaDRKOEHDstApjBfUhmk',
    appId: '1:482066476965:android:7af5794784233dd158824c',
    messagingSenderId: '482066476965',
    projectId: 'chatydemo-cd567',
    storageBucket: 'chatydemo-cd567.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBeOpbfSV-ERaf4uhiG85i-4pfmw0KUIew',
    appId: '1:482066476965:ios:3bdbcba580e0c00d58824c',
    messagingSenderId: '482066476965',
    projectId: 'chatydemo-cd567',
    storageBucket: 'chatydemo-cd567.appspot.com',
    iosBundleId: 'com.yusufcanadiguzel.chatyDemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBeOpbfSV-ERaf4uhiG85i-4pfmw0KUIew',
    appId: '1:482066476965:ios:c66d9626af18cbcc58824c',
    messagingSenderId: '482066476965',
    projectId: 'chatydemo-cd567',
    storageBucket: 'chatydemo-cd567.appspot.com',
    iosBundleId: 'com.yusufcanadiguzel.chatyDemo.RunnerTests',
  );
}
