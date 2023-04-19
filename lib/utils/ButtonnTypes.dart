import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';

class ButtonTypes extends StatelessWidget{
  const ButtonTypes({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Button App Bar"),backgroundColor: AppColors.appColor),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: TextButton(
                child: const Text('TextButton', style: TextStyle(fontSize: 20.0),),
                onPressed: () {
                 callSignUpApi(context,"You click on TextButton");
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                child: const Text('ElevatedButton',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: AppColors.appColor,
                ),
                ),
                onPressed: (){
                  callSignUpApi(context,"You click on ElevatedButton");
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: OutlinedButton(
                child: const Text('OutlinedButton',
                  style: TextStyle(decorationColor: AppColors.appColor,
                    fontSize: 20.0,
                    color: AppColors.colorBlack,

                  ),
                ),
                onPressed: (){
                  callSignUpApi(context,"You click on OutlinedButton");
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: const StadiumBorder(),
                      backgroundColor: AppColors.appColor,
                      shadowColor: AppColors.appColor,
                  ),
                onPressed: (){
                  callSignUpApi(context,"You click on ElevatedButton");
                },
                  child: const Text('ElevatedButton',style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(),
                  backgroundColor: AppColors.appColor,
                  shadowColor: AppColors.appColor,
                ),
                onPressed: (){
                  callSignUpApi(context,"You click on RoundedRectangle Button");
                },
                child: const Text('RoundedRectangle Button',style: TextStyle(fontSize: 15),
              ),
            ),

            ),
          ],
        ),
      ),
    );

  }

  void callSignUpApi(BuildContext context, String strMessage){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Text(strMessage),
    ));
  }
}
