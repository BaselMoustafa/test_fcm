import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_fcm/first_screen.dart';
import 'package:test_fcm/permission_helper/permission_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      PermissionHelper.init();
    });
    _timer = Timer(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(builder: (context) => const FirstScreen()), 
        (_)=>false,
      );
    });
  }


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}