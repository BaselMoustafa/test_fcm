import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:test_fcm/fcm_helper/models/notification_interface.dart';
import 'second_routing_notification.dart';
import 'third_routing_notification.dart';

abstract class RoutingNotification extends NotificationInterface {

  RoutingNotification({
    required super.message
  });

  factory RoutingNotification.fromMessage(RemoteMessage message){
    Map<String,RoutingNotification Function()>routingNotifications=  _routingNotifications(message);
    return routingNotifications[message.data["screenName"]]!();
  }
   
}

Map<String, RoutingNotification Function() > _routingNotifications(RemoteMessage message)=> {
  "second": ()=> SecondRoutingNotification(message: message),
  "third": ()=> ThirdRoutingNotification(message: message),
};
