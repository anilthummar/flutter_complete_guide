import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';
import 'package:flutter_complete_guide/HomeScreen.dart';
import 'package:flutter_complete_guide/Login.dart';
import 'package:flutter_complete_guide/privacy_pages/privacy_policy.dart';
import 'package:flutter_complete_guide/privacy_pages/terms_conditions.dart';
import 'package:flutter_complete_guide/utils/MyCustomButtonWidget.dart';
import 'package:flutter_svg/svg.dart';

import 'utils/RowGoogle.dart';

class SignupScreen extends StatelessWidget{
  final firstText = TextEditingController();
  final lastText = TextEditingController();
  final mobileText = TextEditingController();

  SignupScreen({super.key});

  void dispose() {
    lastText.dispose();
    firstText.dispose();
    mobileText.dispose();
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
            // Login_Header(),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                        child: SvgPicture.asset('assets/images/ic_back.svg',),
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    alignment: Alignment.center,
                    child: Align(
                      child: SvgPicture.asset('assets/images/ic_app_logo.svg',),
                    )),
              ],
            ),
            const SizedBox(height: 15),
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
                        const SizedBox(height: 20),
                        Column(
                          children: <Widget>[
                            Container(

                              padding: const EdgeInsets.all(0),
                              child: const Text('Signup ',
                                style: TextStyle(fontSize: 25,
                                    color: AppColors.btnColor,
                                    fontWeight: FontWeight.bold),),
                            ),
                            const SizedBox(height: 15),
                            //First Name Text Field
                            SizedBox(
                              // width: double.infinity,
                              height: 40,
                              child: TextField(
                                cursorColor: AppColors.colorGray,
                                style: const TextStyle(
                                    color: AppColors.colorGray,decorationColor: AppColors.colorGray),
                                controller: firstText,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  hintText: "First Name",
                                  labelText: "Enter First Name",

                                  labelStyle: TextStyle(color: AppColors.textHintColors,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      fontFamily: 'Poppins-Regular'),

                                  hintStyle: TextStyle(color: AppColors.textHintColors,
                                      fontSize: 10,
                                      fontFamily: 'Poppins-Regular'),
                                  focusColor: AppColors.colorGray,

                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.colorGray),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1,color: AppColors.colorGray),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1,color: AppColors.colorGray),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1,color: AppColors.colorGray),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            //Second Name Text field
                            SizedBox(
                              // width: double.infinity,
                              height: 40,
                              child: TextField(
                                cursorColor: AppColors.colorGray,
                                style: const TextStyle(
                                    color: AppColors.colorGray,decorationColor: AppColors.colorGray),
                                controller: lastText,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  hintText: "Last Name",
                                  labelText: "Enter Last Name",

                                  labelStyle: TextStyle(color: AppColors.textHintColors,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      fontFamily: 'Poppins-Regular'),

                                  hintStyle: TextStyle(color: AppColors.textHintColors,
                                      fontSize: 5,
                                      fontFamily: 'Poppins-Regular'),
                                  focusColor: AppColors.colorGray,

                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.colorGray),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1,color: AppColors.colorGray),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1,color: AppColors.colorGray),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1,color: AppColors.colorGray),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            //Mobile number Text field
                            SizedBox(
                              width: double.infinity,
                              height: 40,

                              child: TextField(
                                controller: mobileText,
                                cursorColor: AppColors.colorGray,
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
                                      fontSize: 10,
                                      fontFamily: 'Poppins-Regular'),
                                  focusColor: AppColors.colorGray,

                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.colorGray),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1,color: AppColors.colorGray),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1,color: AppColors.colorGray),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1,color: AppColors.colorGray),
                                  ),
                                )
                              ),
                            ),
                            const SizedBox(height: 10),
                            Align(alignment: Alignment.center,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                                text: "By continue, I accept ",
                                                style:TextStyle(color: AppColors.colorGray, fontSize: 15,fontFamily: 'Poppins-Regular')
                                            ),
                                            TextSpan(
                                              text: "Terms & Conditions ",
                                              style:const TextStyle(
                                                  color: AppColors.appColor,
                                                  fontWeight: FontWeight.bold,
                                                  decoration: TextDecoration.underline,
                                                  fontSize: 15),
                                              recognizer: TapGestureRecognizer()..onTap=(){
                                                _navigateToHomeScreen(context,const TermsCondition());
                                              },
                                            ),
                                            const TextSpan(
                                              text: "&",
                                              style:TextStyle(
                                                  color: AppColors.colorGray,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            TextSpan(
                                              text: "\n Privacy Policy",
                                              style:const TextStyle(
                                                  color: AppColors.appColor,
                                                  fontWeight: FontWeight.bold,
                                                  decoration: TextDecoration.underline,
                                                  fontSize: 15),
                                              recognizer: TapGestureRecognizer()..onTap=(){
                                                _navigateToHomeScreen(context, const PrivacyPolicy());
                                              },
                                            )
                                          ],),),]
                                )),
                            const SizedBox(height: 10),
                            //Send Button
                            Container(
                              width: double.infinity,
                              height: 50,
                              margin: const EdgeInsets.all(10),
                              child: MyCustomButtonWidget(
                                'Send Code',
                                onTap: () {
                                  if(firstText.text.isEmpty){
                                    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                                      content: Text("Please enter first name"),
                                    ));
                                  }else if(lastText.text.isEmpty){
                                    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                                      content: Text("Pleas enter last name"),
                                    ));
                                  }else if (mobileText.text.isEmpty){

                                    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                                      content: Text("Pleas enter mobile number"),
                                    ));
                                  }else if(mobileText.text.length <10){
                                    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                                      content: Text("Pleas enter valid mobile number"),
                                    ));
                                  }else{
                                    _navigateToHomeScreen(context, HomeScreen());
                                  }
                                },
                              ),
                            ),
                          ],

                        ),

                        const SizedBox(height: 20,),
                        const Text("Or login with social media", style: TextStyle(
                            color: AppColors.colorGray,fontWeight: FontWeight.normal,
                            fontSize: 15,fontFamily: 'Poppins-Regular'),),
                        const SizedBox(height: 20,),
                        Row(
                          children: const <Widget>[
                            Expanded(
                              child: RowGoogle(),),
                            Expanded(
                              child: RowApple(),),
                            Expanded(
                              child: RowFaceBook(),),
                          ],
                        ),
                        const SizedBox(height: 30,),


                        Align(alignment: Alignment.bottomCenter,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                            text: "Already have an account? ",
                                            style:TextStyle(color: AppColors.colorGray, fontSize: 15,fontFamily: 'Poppins-Regular')
                                        ),
                                        TextSpan(
                                          text: "Login",
                                          style:const TextStyle(
                                              color: AppColors.appColor,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.underline,
                                              fontSize: 15),
                                          recognizer: TapGestureRecognizer()..onTap=(){
                                            _navigateToHomeScreen(context,LoginScreen());
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