import 'package:firebase_messaging/firebase_messaging.dart';

import 'models/notification_interface.dart';

abstract class FcmHelper {
  const FcmHelper();

  static Future<void> init()async{

    RemoteMessage? initialMessage=await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) => _handleMessage(message),
    );

  }

  static void _handleMessage(RemoteMessage message) {
    NotificationInterface.fromMessage(message).toExecute();
  }

}
