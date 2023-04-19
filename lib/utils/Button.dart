import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  const CustomButton({super.key});


  @override
  Widget build(BuildContext context) {
    const btnColor = Color(0xff00923A); // Second `const` is optional in assignments.

    return Container(
      height: 50,
      // margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text("Login",style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}