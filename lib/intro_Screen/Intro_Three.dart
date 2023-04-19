import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';

import '../utils/Header.dart';

class IntroThree extends StatelessWidget{
  const IntroThree({Key? key}): super(key: key);

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
            Column(
              children: const [
                Expanded(flex:5,child: Introone()),
                Expanded(flex:5,child: SizedBox()),
              ],
            ),
            Column(
              children: <Widget>[
                const Expanded(flex: 4, child: SizedBox()),
                Expanded(
                  flex: 6,
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
                                      'No 1 app for \n organizers',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: AppColors.btnColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 35),
                                    Text(
                                      'Quickly fill Tournament, Open Play and \n Leagues in hours, not days',
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