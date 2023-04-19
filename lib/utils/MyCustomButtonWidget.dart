
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';

class MyCustomButtonWidget extends StatelessWidget{

  String strText="";
  late final VoidCallback? onTap;


  MyCustomButtonWidget(this.strText,

  {
    Key? key,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(

            shape: const StadiumBorder(),
            backgroundColor: AppColors.appColor,

            shadowColor: AppColors.appColor,
            textStyle: const TextStyle(
            fontFamily: 'Poppins-Regular',
                fontSize: 15
          )
        ),

      onPressed: onTap,
      child: Text(strText),
    );
  }



}