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
    apiKey: 'AIzaSyAant0K1-92-DswNMoqUU_kKaMKK0EFKbA',
    appId: '1:681570161969:web:39cd906346c1858e804c10',
    messagingSenderId: '681570161969',
    projectId: 'vfood-72eda',
    authDomain: 'vfood-72eda.firebaseapp.com',
    storageBucket: 'vfood-72eda.firebasestorage.app',
    measurementId: 'G-FCY449EP0H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCp68BP2CM8JorzcnvLPuEnjRHlnFwgiTY',
    appId: '1:681570161969:android:563e6f4fc299f010804c10',
    messagingSenderId: '681570161969',
    projectId: 'vfood-72eda',
    storageBucket: 'vfood-72eda.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSicOoRcFV9-yR1YeuRkQ3sGsW01TckJk',
    appId: '1:681570161969:ios:43f83ce1a58f5fed804c10',
    messagingSenderId: '681570161969',
    projectId: 'vfood-72eda',
    storageBucket: 'vfood-72eda.firebasestorage.app',
    androidClientId: '681570161969-fr30maqbqqmfdqhqte648h2eu5p01f26.apps.googleusercontent.com',
    iosClientId: '681570161969-jh0ikueg928995l67snid2383b2pml9b.apps.googleusercontent.com',
    iosBundleId: 'com.bestrong.vfood',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCSicOoRcFV9-yR1YeuRkQ3sGsW01TckJk',
    appId: '1:681570161969:ios:43f83ce1a58f5fed804c10',
    messagingSenderId: '681570161969',
    projectId: 'vfood-72eda',
    storageBucket: 'vfood-72eda.firebasestorage.app',
    androidClientId: '681570161969-fr30maqbqqmfdqhqte648h2eu5p01f26.apps.googleusercontent.com',
    iosClientId: '681570161969-jh0ikueg928995l67snid2383b2pml9b.apps.googleusercontent.com',
    iosBundleId: 'com.bestrong.vfood',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAant0K1-92-DswNMoqUU_kKaMKK0EFKbA',
    appId: '1:681570161969:web:0f24a79a46f9c415804c10',
    messagingSenderId: '681570161969',
    projectId: 'vfood-72eda',
    authDomain: 'vfood-72eda.firebaseapp.com',
    storageBucket: 'vfood-72eda.firebasestorage.app',
    measurementId: 'G-44CDS7WBF8',
  );

}