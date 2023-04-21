import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/setupprofile/SetUpMain.dart';
import 'package:flutter_complete_guide/setupprofile/SetUpProfile.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';
import 'package:flutter_complete_guide/utils/MyCustomButtonWidget.dart';
import 'package:flutter_svg/svg.dart';

import 'OtpInput.dart';
import 'SignupScreen.dart';

class SendOtpScreen extends StatefulWidget {
  SendOtpScreen({Key? key}) : super(key: key);
  final _text = TextEditingController();


  @override
  State<SendOtpScreen> createState() => _SendOtpScreen();

  void dispose() {
    _text.dispose();
    //_timer.cancel();
  }

}

class _SendOtpScreen extends State<SendOtpScreen> {
  // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  late Timer mTimer;
  // This is the entered code
  // It will be displayed in a Text widget

  // late Timer _timer;
  // int _start = 60;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mTimer.cancel();
  }

  double _width = 100.0;

  void _changeWidth() {
    setState(() {
      _width = 200.0;
    });
  }




  startTimer() {
      Timer mTimer =Timer(Duration(seconds: 5), () {
        _changeWidth();

      });
//      mTimer.cancel();

  }



  @override
  Widget build(BuildContext context) {
    // startTimer();

    return Scaffold(
      // Image.asset('assets/images/ic_back_arrow.jpg'
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            AppColors.appColor,
            AppColors.appColor,
            AppColors.appColor
          ]),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
        const SizedBox(height: 15),
        // Login_HeaderBackImage(),
        Stack(
          children: [
            Container(
              height: 40,
             width: 20,
             margin: EdgeInsets.only(top: 30,left: 5),
              child:Positioned(
               top: 40,
               left: 10,
               width: MediaQuery.of(context).size.width * 0.15,
               height: MediaQuery.of(context).size.height * 0.1,
               child: InkWell(
                 onTap: () {
                   Navigator.pop(context);
                 },
                 child: Align(
                   child: SvgPicture.asset('assets/images/ic_back.svg',),),
               ),
             ),
           ),
            Container(
              alignment: Alignment.center,
              child: Center(

                child:AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: _width,
                  height: 100.0,
                  color: AppColors.appColor,
                  curve: Curves.bounceInOut,

                  child: Center(
                    child :Align(
                      child: SvgPicture.asset('assets/images/ic_app_logo.svg',),
                        // Image.asset('assets/images/ic_logo_splash.png', scale: 7.0,),
                      ))

                    // child: Text(
                    //   'Tap to animate width',
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 20.0,
                    //   ),
                    // ),
                  // ),
              ),
            ),
            ),
              // width: MediaQuery.of(context).size.width * 0.75,
              // alignment: Alignment.center,
              // child: Align(
              //   child:
              //   SvgPicture.asset('assets/images/ic_app_logo.svg',),
              //   // Image.asset('assets/images/ic_logo_splash.png', scale: 7.0,),
              // )),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
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
                                  child: const Text(
                                    'OTP Verification ',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: AppColors.btnColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Enter the OTP sent to +1 123 456 7890',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.colorGray,
                                      fontWeight: FontWeight.normal),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "00:28",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.appColor,
                                      fontWeight: FontWeight.normal),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    OTPInput(_fieldOne, true), // auto focus
                                    OTPInput(_fieldTwo, false),
                                    OTPInput(_fieldThree, false),
                                    OTPInput(_fieldFour, false)
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  height: 50,
                                  margin: const EdgeInsets.all(10),
                                  child: MyCustomButtonWidget(
                                    'Submit',
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                              builder :(context){
                                                return SetUpMain();
                                              }));
                                      _changeWidth();
                                    },
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(height: 60),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Resend Code",
                                          style: const TextStyle(
                                              color: AppColors.appColor,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                              TextDecoration.underline,
                                              fontSize: 15),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              //_navigateToHomeScreen(context,SignupScreen());
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ])),
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