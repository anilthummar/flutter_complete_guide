import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/setupprofile/SetUpMain.dart';
import 'package:flutter_complete_guide/setupprofile/SetUpProfile.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';
import 'package:flutter_complete_guide/HomeScreen.dart';
import 'package:flutter_complete_guide/utils/Header.dart';
import 'package:flutter_complete_guide/utils/MyCustomButtonWidget.dart';

import 'utils/RowGoogle.dart';
import 'SignupScreen.dart';

class LoginScreen extends StatelessWidget{

  final _text = TextEditingController();

  LoginScreen({super.key});

  void dispose() {
    _text.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  AppColors.appColor,
                  AppColors.appColor,
                  AppColors.appColor
                ]
            ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             const SizedBox(height: 5),
            const LoginHeaders(),
            const SizedBox(height: 1),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 25),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),

                          ),

                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(0),
                                child: const Text('Login ',
                                    style: TextStyle(fontSize: 25,
                                    color: AppColors.btnColor,
                                    fontWeight: FontWeight.bold),),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                width: double.infinity,
                                height: 50,
                                padding: const EdgeInsets.only(left: 5,right: 5),

                                child: TextField(
                                  controller: _text,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                      hintText: "Mobile number",
                                      labelText: "Enter mobile number",
                                      labelStyle: TextStyle(color: AppColors.textHintColors,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          fontFamily: 'Poppins-Regular'),
                                      hintStyle: TextStyle(color: AppColors.textHintColors,
                                          fontSize: 15,
                                          fontFamily: 'Poppins-Regular'),
                                      border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                width: double.infinity,
                                height: 50,
                                margin: const EdgeInsets.all(10),
                                child: MyCustomButtonWidget(
                                  'Send Code',
                                  onTap: () {
                                    if(_text.text.isEmpty){
                                      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                                        content: Text("Please enter mobile number to get otp"),
                                      ));
                                    }else if(_text.text.length <10){
                                      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                                        content: Text("Pleas enter valid mobile number"),
                                      ));
                                    }else{
                                      _navigateToHomeScreen(context,const HomeScreen());
                                    }
                                  },
                                ),
                              ),
                            ],

                        )),

                        const SizedBox(height: 25,),
                        const Text("Or login with social media", style: TextStyle(
                            color: AppColors.colorGray,fontWeight: FontWeight.normal,
                        fontSize: 15,fontFamily: 'Poppins-Regular'),),
                        const SizedBox(height: 25,),
                        Row(
                          children: const <Widget>[
                            SizedBox(width: 1,),
                            Expanded(
                              child: RowGoogle(),),
                            SizedBox(width: 1,),
                            Expanded(
                              child: RowApple(),),
                            SizedBox(width: 1,),
                            Expanded(
                              child: RowFaceBook(),),
                          ],
                        ),
                        const SizedBox(height: 50,),

                        Align(alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                            text: "Don't have an account? ",
                                            style:TextStyle(color: AppColors.colorGray, fontSize: 15,fontFamily: 'Poppins-Regular')
                                        ),
                                        TextSpan(
                                          text: "Signup",
                                          style:const TextStyle(
                                              color: AppColors.appColor,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.underline,
                                              fontSize: 15),
                                          recognizer: TapGestureRecognizer()..onTap=(){
                                            _navigateToHomeScreen(context,SetUpMain());
                                          },
                                        ),
                              ],),),]
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _navigateToHomeScreen(BuildContext context, Widget homeScreen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => homeScreen));
}
