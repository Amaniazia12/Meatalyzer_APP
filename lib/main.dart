
import 'package:Meatalyzer_app/Screens/Information_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'Screens/Slider_screen.dart';
import './Screens/Camera_Screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Onborading",
      theme: ThemeData(
        //primaryColor: Colors.black87,
        accentColor: Colors.white,
       ),
      home: AnimatedSplashScreen(
          splash:Image.asset('assets/images/img8.png',height: 200,width: 300,),
          backgroundColor:  Colors.red[900],
          nextScreen: Slider_screen(),
        ),
      debugShowCheckedModeBanner:false,
      routes: {
        Information_screen.routName:(ctx)=>Information_screen(),
        Camera_screen.routName:(ctx)=>Camera_screen(),
      }
    );
}
}