import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_fcm/fcm_helper/fcm_helper.dart';
import 'package:test_fcm/permission_helper/permission_helper.dart';

import 'firebase_options.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

 @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
    FirebaseMessaging.instance.getToken().then((value) => print("FCM TOKEN====>$value"));
    
    await FcmHelper.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            PermissionHelper.excuteAfterCheckPermissions(
              permissions:[
                Permission.camera,
                Permission.microphone,
              ], 
              toExcute: () {
                print("🔥Permission Granted And Will Excute The Code🔥");
              },
            );
          },
          child: const Text("Ask Permission"),
        ),
      ),
    );
  }
}