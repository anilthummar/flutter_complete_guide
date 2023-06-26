import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/getxeample/getxbasicexample.dart';
import 'package:flutter_complete_guide/getxeample/navigation_second.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class NavigationThird extends StatefulWidget {
  const NavigationThird({Key? key}) : super(key: key);

  @override
  State<NavigationThird> createState() => _NavigationThirdState();
}

class _NavigationThirdState extends State<NavigationThird> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:Container(
          child: ElevatedButton(
          onPressed: () => {

            Get.to(NavigationSecond()),
          },
            child: Text("Back to Second Screen"),),

        ),


      ),
    );
  }
}
