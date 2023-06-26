import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/getxeample/getxbasicexample.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'navigation_third.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({Key? key}) : super(key: key);

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:Container(
          child: Center(
            child: Text("Navigation Second screen"),
          ),
        ),


      ),
    );
  }
}
