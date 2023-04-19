import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';

class OTPInput extends StatelessWidget{
  final TextEditingController controller;
  final bool autoFocus;
  const OTPInput(this.controller, this.autoFocus,
      {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
        child: Theme(
          data: ThemeData(
            primaryColor: AppColors.appColor,
            primaryColorDark: AppColors.appColor
          ),
          child: TextField(
            cursorColor: AppColors.appColor,
            style: const TextStyle(
            color: AppColors.appColor,decorationColor: AppColors.borderColor),
            autofocus: autoFocus,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            controller: controller,
            maxLength: 1,

            decoration: const InputDecoration(

              hoverColor: AppColors.appColor,

              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.appColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 1,color: AppColors.appColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 1,color: AppColors.appColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 1,color: AppColors.appColor),
              ),


              counterText: '',
              hintStyle: TextStyle(
                color:AppColors.appColor,
              ),),

            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
    );
  }
}