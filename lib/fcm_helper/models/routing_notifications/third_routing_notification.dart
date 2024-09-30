import 'package:flutter/material.dart';
import 'package:test_fcm/fcm_helper/models/routing_notifications/routing_notification.dart';
import 'package:test_fcm/main.dart';

import '../../../third_screen.dart';

class ThirdRoutingNotification extends RoutingNotification {

  

  ThirdRoutingNotification({
    required super.message
  });
  
  @override
  void toExecute() {
    navigatorKey.currentState!.push(
      MaterialPageRoute(
        builder: (context) => const ThirdScreen()
      )
    );
  }
}