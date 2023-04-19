import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';
import 'package:flutter_complete_guide/intro_Screen/Intro_One.dart';
import 'package:flutter_complete_guide/intro_Screen/Intro_Three.dart';
import 'package:flutter_complete_guide/Login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Intro_Two.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen ({Key? key}) : super(key: key);


  @override
  _OnBoardingScreenState createState()=> _OnBoardingScreenState();


}

class _OnBoardingScreenState extends State<IntroScreen>{

  // Controller keep track of which page we are on
  final PageController _controller = PageController();
  bool onLastPage= false;
  bool widgetVisible = true ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(
        // page view
        children: [
          PageView(
          controller: _controller,
          onPageChanged: (index) {
          setState(() {
            onLastPage=(index==2);
          });

          },
          children: const [
            IntroOne(),
            IntroTwo(),
            IntroThree(),
                      ],

        ),

        // Dot Indicator

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Visibility(
              visible: widgetVisible,
              child: Container(
              alignment: const Alignment(0,0.95),
              child: GestureDetector(
                onTap:(){
                  _controller.jumpToPage(2);
                },
                child:const SizedBox(
                  height: 40,
                  width: 80,
                  child: Padding(
                    padding: EdgeInsets.all(1.5),
                    child: Center(
                      child: Text('Skip',style: TextStyle(color: AppColors.btnColor)),

                    ),
                  ),
                ),
              ),
            ),),
            // Skip Button

            //Indicator
            Container(
              alignment: const Alignment(0,0.75),
              child :SmoothPageIndicator(controller: _controller, count: 3),
            ),
            Container(

              alignment: const Alignment(0,0.95),
              child: onLastPage?GestureDetector(
                onTap:(){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder :(context){
                            return LoginScreen();
                          }));
                },
                child: SizedBox(
                  height: 40,
                  width: 110,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: const StadiumBorder(),
                      backgroundColor: AppColors.appColor,
                      shadowColor: AppColors.appColor,
                    ),
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder :(context){
                                return LoginScreen();
                              }));
                    },
                    child: const Text('Get Started ',style: TextStyle(fontFamily: 'Poppins-Regular',fontSize: 15)),

                  ),
                ),

              ):GestureDetector(

                onTap:(){
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child:  Container(
                  decoration: BoxDecoration(
                    color: AppColors.appColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 40,
                  width: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: const Center(
                        child: Text('Next',style: TextStyle(color: AppColors.appColor)),
                      ),
                    ),
                  ),

                ),
                //Next Butto
              ),
            ),


          ],
        ),
        ],

      ),
    );

  }

  void showWidget(){
    setState(() {
      widgetVisible = true ;
    });
  }

  void hideWidget(){
    setState(() {
      widgetVisible = false ;
    });
  }
}
