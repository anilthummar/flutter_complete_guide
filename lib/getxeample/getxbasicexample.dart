import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/listingscreengetx.dart';
import 'navigation_second.dart';



class GetXBasicExample extends StatefulWidget {
  const GetXBasicExample({Key? key}) : super(key: key);

  @override
  State<GetXBasicExample> createState() => _GetXBasicExampleState();
}

class _GetXBasicExampleState extends State<GetXBasicExample> {

  GetXBasicExampleController mGetXBasicExampleController =Get.put(GetXBasicExampleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Basic"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Obx(() =>Text("${mGetXBasicExampleController.counter}")),
              InkWell(
                child: Text("Click here GetX Basic"),
                onTap: () => {
                  mGetXBasicExampleController.increment()
                },
              ),
              ElevatedButton(onPressed: () => {

                Get.to(NavigationSecond()),
              },
                  child: Text("Navigate to Second screen"),),

              ElevatedButton(onPressed: () => {

                Get.to(ListingScreen()),
              },
                  child: Text("Call List API"),),
            ],
          ),
        ),
      ),

    );
  }
}


class GetXBasicExampleController extends GetxController{

  RxInt counter=0.obs;

  increment(){
    counter.value++;
  }
}

