import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:test_fcm/fcm_helper/models/normal_notification.dart';
import 'package:test_fcm/fcm_helper/models/routing_notifications/routing_notification.dart';

abstract class NotificationInterface{

  final RemoteMessage message;

  NotificationInterface({
    required this.message
  });

  factory NotificationInterface.fromMessage(RemoteMessage message){
    if (message.data.containsKey("screenName")) {
      return RoutingNotification.fromMessage(message);
    }
    return NormalNotification(
      message: message
    );
  }

  void toExecute();

}
