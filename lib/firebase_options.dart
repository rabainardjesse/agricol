import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

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

      case TargetPlatform.windows:
        return windows;

      default:
        throw UnsupportedError(
          'This platform is not supported by Firebase',
        );
    }
  }

  // ✅ ANDROID (YOU WERE MISSING THIS BEFORE)
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'YOUR_ANDROID_API_KEY',
    appId: 'YOUR_ANDROID_APP_ID',
    messagingSenderId: '744541386790',
    projectId: 'igrow-app-49411',
    storageBucket: 'igrow-app-49411.appspot.com',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBRoxQ4tx3cwcVsgYIBxTTzCKT9Lv7RBak',
    appId: '1:744541386790:web:158cf27fea3441a18b4ee7',
    messagingSenderId: '744541386790',
    projectId: 'igrow-app-49411',
    authDomain: 'igrow-app-49411.firebaseapp.com',
    storageBucket: 'igrow-app-49411.firebasestorage.app',
    measurementId: 'G-H80CQN2WWN',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'YOUR_IOS_API_KEY',
    appId: '1:744541386790:ios:7f7a1204f739c7318b4ee7',
    messagingSenderId: '744541386790',
    projectId: 'igrow-app-49411',
    storageBucket: 'igrow-app-49411.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBRoxQ4tx3cwcVsgYIBxTTzCKT9Lv7RBak',
    appId: '1:744541386790:web:6c16b33f87b5b88d8b4ee7',
    messagingSenderId: '744541386790',
    projectId: 'igrow-app-49411',
    storageBucket: 'igrow-app-49411.firebasestorage.app',
  );
}