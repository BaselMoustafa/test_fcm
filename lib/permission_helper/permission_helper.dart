import 'package:permission_handler/permission_handler.dart';

abstract class PermissionHelper{

  static void init(){
    _requestNotificationPermission();
  }

  static void _requestNotificationPermission(){

  }

  static Future<void>excuteAfterCheckPermissions({
    required List<Permission> permissions,
    required Function() toExcute,
  })async{

    if (permissions.contains(Permission.notification)) {
      throw Exception(
        "Permission.notification is not allowed in excuteAfterCheckPermissions method"
      );    
    }

    if(await permissions.isGranted){
      await toExcute();
    }

    else if(await permissions.isPermanentlyDenied){
      openAppSettings();
    }

    else{
      final permissionsStatusMap=await permissions.request();

      permissions.clear();
      
      permissionsStatusMap.forEach((key, value) async{
        permissions.add(key);
      });

      if(await permissions.isGranted){
        await toExcute();
      }
    }

  }

}

extension _PermisionListExtention on List<Permission>{

  Future<bool> get isGranted async{
    for (var i = 0; i < length; i++) {
      if (! await this[i].status.isGranted) { 
        return false;
      }
    }
    return true;
  }

  Future<bool> get isPermanentlyDenied async{
    for (var i = 0; i < length; i++) {
      if (await this[i].status.isPermanentlyDenied) {
        return true;
      }
    }
    return false;
  }
  
}
