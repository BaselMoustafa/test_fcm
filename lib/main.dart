import 'package:flutter/material.dart';
import 'package:test_fcm/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


void main() async{
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey:navigatorKey ,
      debugShowCheckedModeBanner: false,
      home:const SplashScreen(),
    );
  }
}
