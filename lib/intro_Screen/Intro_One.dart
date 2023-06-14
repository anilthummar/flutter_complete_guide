import 'package:flutter_complete_guide/utils/AppColors.dart';
import 'package:flutter/material.dart';
import '../utils/Header.dart';

class IntroOne extends StatelessWidget{
  const IntroOne({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.colorBlack,
        ),
        child: Stack(

          children: [
            Column(children:  [
              Expanded(flex:8,
                  child: Image.asset('assets/images/ic_intro_one.png',
                     height:(MediaQuery.of(context).size.height)/2,
                      width: double.infinity,
                      fit: BoxFit.fitHeight,
                  ),
              ),
                  //child: Introone()),
              Expanded(flex:5,child: SizedBox())
            ],),
            Column(
              children: <Widget>[
                const Expanded(flex: 8, child: SizedBox()),
                Expanded(flex: 6,
                  child: Container(
                    width: double.maxFinite,
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
                            const SizedBox(height: 35),
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: const <Widget>[
                                    Text(
                                      'Find and fill \n matches fast ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                      fontSize: 25,
                                      color: AppColors.btnColor,
                                      fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 35),
                                    Text(
                                      'Centralize your communication and fill \n matches in minutes not hours',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.colorGray,
                                      fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

  }

}