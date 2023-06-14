import 'package:flutter/material.dart';

import '../utils/AppColors.dart';

class Events extends StatefulWidget{
  @override
  _Events  createState() =>  _Events();
  }

class _Events extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index){

            return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all( Radius.circular(10),),
                          side: BorderSide(width: 2, color: AppColors.appColor)),
                      child: ListTile(
                        title: Text("Event $index"),
                      ),);
            },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: AppColors.appColor,height: 1,thickness: 2,
          ),
          itemCount:20),
    );
  }

}