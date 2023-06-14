import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';

class Matches extends StatefulWidget{
  @override
  _Matches  createState() =>  _Matches();
  }

class _Matches extends State<Matches> {
  List<String> MyMatchesList = ["1","2"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index){
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all( Radius.circular(10),),
                    side: BorderSide(width: 2, color: AppColors.appColor)),
                child: ListTile(
                  onTap: () => {
                    debugPrint("You click on $index Matches")
                  },
                  title: Text("Matches $index"),
                ),

              );
            },),
      ),
    );
  }

}