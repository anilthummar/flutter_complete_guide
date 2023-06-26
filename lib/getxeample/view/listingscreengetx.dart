import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/conversionratecontroller.dart';

class ListingScreen extends StatelessWidget {
  final ConversionRatesController upcomingController =
      Get.put(ConversionRatesController());

  Widget build(BuildContext context) {
    // upcomingController.getUserDataList();
    return Scaffold(
      appBar: AppBar(
        title: Text("User List Data"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: Obx(() {
            if (upcomingController.isLoading.value) {
              return Center(child: CircularProgressIndicator());

            } else {
              return ListView.builder(
                itemCount: upcomingController.userdatamodellist.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                       Container(
                         margin: EdgeInsets.only(left: 20, right: 20),
                         padding: EdgeInsets.only(left: 20),
                         height: 80,
                         width: MediaQuery.of(context).size.width,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(20)),


                         child: Row(

                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                  upcomingController.userdatamodellist.value[index].picture.toString()),
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Container(

                                  child: Text(
                                    upcomingController.userdatamodellist.value[index].firstName.toString(),
                                    style: const TextStyle(color: Colors.black, fontSize: 18),
                                  ),
                                ),
                              ],
                            ),

                          ],
                      ),
                       ),
                    ],
                  );
                },
              );
            }
          }))
        ],
      ),
    );
  }
}
