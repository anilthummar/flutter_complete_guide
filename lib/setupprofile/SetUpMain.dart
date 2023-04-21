import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/setupprofile/SetUpProfile.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Login.dart';
import '../intro_Screen/Intro_One.dart';
import '../intro_Screen/Intro_Three.dart';
import '../intro_Screen/Intro_Two.dart';
import '../utils/NumberStepper.dart';
import 'SetUpProfileThree.dart';
import 'SetUpProfileTwo.dart';

class SetUpMain extends StatefulWidget {
  const SetUpMain ({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState()=> _OnBoardingScreenState();

}

class _OnBoardingScreenState extends State<SetUpMain>{
  int currentStep = 1;
  int stepLength = 3;
  late bool complete;

  next() {
    if (currentStep <= stepLength) {
      goTo(currentStep + 1);
    }
  }

  back() {
    if (currentStep > 1) {

      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
    if (currentStep > stepLength) {
      setState(() => complete = true);

    }
  }


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
                print("onLastPage_:$onLastPage : $index");
                onLastPage=(currentStep==3);
              });
            },
            children: const [
              SetUpProfile(),
              SetUpProfileTwo(),
              SetUpProfileThree(),
            ],
          ),
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
                         // child: Text('Skip',style: TextStyle(color: AppColors.btnColor)),

                        ),
                      ),
                    ),
                  ),
                ),),
              // Skip Button



            ],
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child:SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: Card(
                color: AppColors.colorWhite,
                elevation: 0,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumberStepper(
                      totalSteps: stepLength,
                      width: 210,
                      //MediaQuery.of(context).size.width,
                      curStep: currentStep,
                      stepCompleteColor: AppColors.appColor,
                      currentStepColor: AppColors.colorDropdown,
                      inactiveColor: AppColors.colorLine,
                      lineWidth: 3.5,
                    ),
                    //Back Button
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: currentStep == 1
                            ? null
                            : () {
                          back();
                          if(currentStep==1){
                            _controller.jumpToPage(0);
                          }else if (currentStep==2){
                            _controller.jumpToPage(1);
                          }else if(currentStep==3){
                            _controller.jumpToPage(2);
                          }

                        },
                        child: Container(
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
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text('Back',
                                  style:  TextStyle(color: AppColors.appColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Next Button
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                          onTap: () {
                            next();
                            print("currentStep_: $currentStep");
                            if(currentStep==1){
                              _controller.jumpToPage(0);
                            }else if (currentStep==2){
                              _controller.jumpToPage(1);
                            }else if(currentStep==3){
                              _controller.jumpToPage(2);
                            }
                          },
                          child: Container(
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
                                child: Center(
                                  child: onLastPage?GestureDetector(
                                    onTap:(){
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(
                                      //         builder :(context){
                                      //           return LoginScreen();
                                      //         }));
                                    },
                                    child: Text('Finish',
                                        style: const TextStyle(
                                            color: AppColors.appColor),

                                    ),
                                  ):GestureDetector(

                                    onTap:(){
                                      // _controller.nextPage(
                                      //     duration: const Duration(milliseconds: 500),
                                      //     curve: Curves.easeIn);
                                    },
                                    child: Text('Next',
                                      style: const TextStyle(
                                          color: AppColors.appColor),
                                    ),
                                ),
                              ),
                            ),
                            ),
                          ),

                        // child: Text(
                        //   currentStep == stepLength ? 'Finish' : 'Next',
                        //   style: const TextStyle(color: Colors.white),
                        // ),

                      ),
                    )
                  ],
                ),
              ),
            ),
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
