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
    apiKey: 'AIzaSyAjcQSor1hzkVQ1AwucR35cgIEKwmY1NEI',
    appId: '1:634706339097:web:0c5dfb1bbfa45765dc9188',
    messagingSenderId: '634706339097',
    projectId: 'suvastu-food',
    authDomain: 'suvastu-food.firebaseapp.com',
    storageBucket: 'suvastu-food.appspot.com',
    measurementId: 'G-Y74KTQ2PMC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDudKOoqelmez6_KXVkTnlRDFGYFx3mgLk',
    appId: '1:634706339097:android:c862a59d9d3c7db8dc9188',
    messagingSenderId: '634706339097',
    projectId: 'suvastu-food',
    storageBucket: 'suvastu-food.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAU1_3kgfMIeo9_1o-P7JnNIKMXxOr7Nyg',
    appId: '1:634706339097:ios:c6b69618524282c6dc9188',
    messagingSenderId: '634706339097',
    projectId: 'suvastu-food',
    storageBucket: 'suvastu-food.appspot.com',
    iosBundleId: 'com.suvastutech.suvastufood',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAU1_3kgfMIeo9_1o-P7JnNIKMXxOr7Nyg',
    appId: '1:634706339097:ios:069df78a65c303d3dc9188',
    messagingSenderId: '634706339097',
    projectId: 'suvastu-food',
    storageBucket: 'suvastu-food.appspot.com',
    iosBundleId: 'com.suvastutech.suvastufood.RunnerTests',
  );
}