import 'package:flutter/material.dart';

import '../utils/AppColors.dart';


class CustomBoxDecoration extends StatelessWidget{
  const CustomBoxDecoration({super.key});


  @override
  Widget build(BuildContext context) {

    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.appColor,
                AppColors.appColor,
                AppColors.appColor
              ]),
        )
    );

  }
}