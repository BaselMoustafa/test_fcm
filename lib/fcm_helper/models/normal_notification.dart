import 'package:test_fcm/fcm_helper/models/notification_interface.dart';

class NormalNotification extends NotificationInterface{

  NormalNotification({
    required super.message
  });

  @override
  void toExecute() {
    
  }
  
}