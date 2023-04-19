import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/AppColors.dart';


class PrivacyPolicy extends StatelessWidget{
  const PrivacyPolicy({super.key});



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Align(
                                child:
                                SvgPicture.asset(
                                    color: AppColors.colorBlack,
                                    'assets/images/ic_back.svg')
                          ),
                          ),
                        ),
                        const SizedBox(
                          child: Text("Privacy Policy",
                            style: TextStyle(
                                fontSize: 17,
                                color: AppColors.btnColor,
                                fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: AppColors.colorBlack),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        AppColors.privacyText1,
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColors.btnColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      width: double.infinity,
                      child: const Text(
                        AppColors.privacyText2,
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColors.btnColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        AppColors.privacyText1,
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColors.btnColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      width: double.infinity,
                      child: const Text(
                        AppColors.privacyText3,
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColors.btnColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        AppColors.privacyText1,
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColors.btnColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }



}