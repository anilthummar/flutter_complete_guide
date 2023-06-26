import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/HomeScreen.dart';
import 'package:flutter_complete_guide/intro_Screen/Intro_One.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'bottompages/events.dart';
import 'bottompages/matches.dart';
import 'getxeample/getxbasicexample.dart';
import 'getxeample/view/listingscreengetx.dart';
import 'intro_Screen/IntroSCreen.dart';


void main(){

  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    String strTitle="Splash Screen";

    return GetMaterialApp(
      title:strTitle,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }

}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>{

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
    Timer(
        const Duration(seconds:3 ),
        // ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen())));
        // ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  GetXBasicExample())));
        ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  ListingScreen())));
  }


  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topRight,
            colors: [AppColors.startColor,AppColors.endColor]
        ),

      ),
       child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.75,
            alignment: Alignment.center,
            child: Align(
              child: SvgPicture.asset('assets/images/ic_app_logo.svg',),
            ),
       ),
    );

  }

}

