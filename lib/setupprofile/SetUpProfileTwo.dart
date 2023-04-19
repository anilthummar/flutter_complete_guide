
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';
import 'package:flutter_complete_guide/HomeScreen.dart';
import 'package:flutter_complete_guide/utils/MyCustomButtonWidget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../MyRadioGroup.dart';
import '../intro_Screen/IntroSCreen.dart';
import '../intro_Screen/Intro_One.dart';
import '../intro_Screen/Intro_Three.dart';
import '../intro_Screen/Intro_Two.dart';
import '../privacy_pages/terms_conditions.dart';
import '../utils/NumberStepper.dart';
import 'CustomSlider.dart';

class SetUpProfileTwo extends StatefulWidget {
  const SetUpProfileTwo({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldDesignPageState createState() => _TextFieldDesignPageState();
}

class _TextFieldDesignPageState extends State<SetUpProfileTwo> {

  var _ratingController = TextEditingController();
   double _rating=0.0;
  int _ratingBarMode = 1;
  IconData? _selectedIcon;

  int valueHolder = 0;

  double value = 50;
  double actualValue = 50;
  double minValue = 0;
  double maxValue = 100;
  List<double> steps = [0,5,10,15,20,25,30,35,40,45,50,60,70,80,90,100];


  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child:  Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 15),
                Container(
                  color: AppColors.appColor,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Align(
                                  child: SvgPicture.asset(
                                    'assets/images/ic_back.svg',
                                  ),
                                ),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context)
                                  .size
                                  .width *
                                  0.75,
                              alignment: Alignment.center,
                              child: Align(
                                child: SvgPicture.asset(
                                    'assets/images/ic_app_logo.svg'),
                              )),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 20),
                              Column(
                                children: <Widget>[
                                  const Text(
                                    'Rate Your Skill Level',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: AppColors.btnColor,
                                        fontWeight:
                                        FontWeight.bold),
                                  ),
                                  // card view
                                  const SizedBox(height: 20),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  [
                                      Padding(
                                        padding: EdgeInsets.all(1),
                                        child: Text("${_rating}",
                                          style: TextStyle(
                                            color:
                                            AppColors.btnColor,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Tell us types of matches text
                                  const SizedBox(height: 20),
                                  RatingBar(
                                    allowHalfRating: false,
                                    onRatingUpdate: (value) {
                                      print("RatingBar_: $value");
                                      // _rating=valueHolder.round() as double;
                                      _rating=value;
                                    },
                                    ratingWidget: RatingWidget(

                                      full: SvgPicture.asset('assets/images/ic_full_border.svg',color: AppColors.colorYellow,),
                                      half: SvgPicture.asset('assets/images/ic_half_border.svg',color: AppColors.colorLine,),
                                      empty: SvgPicture.asset('assets/images/ic_empty_border.svg',color: AppColors.colorLine,),
                                    ),
                                    itemCount: 5,

                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: CustomSlider(
                                        minValue: minValue,
                                        maxValue: maxValue,
                                        value: value,
                                        majorTick: 6,
                                        minorTick: 2,
                                        labelValuePrecision: 0,
                                        tickValuePrecision: 0,
                                        onChanged: (val) => setState(() {
                                          value = val;
                                          actualValue =
                                          steps[(val / maxValue * (steps.length - 1)).ceil().toInt()];
                                          print('Slider value (linear): $value');
                                          print('Actual value (non-linear): $actualValue');
                                          _rating=actualValue;
                                        }),
                                        activeColor: AppColors.colorYellow,
                                        // inactiveColor: Colors.orange.shade50,
                                        linearStep: false,
                                        steps: steps,
                                      )
                                      // Slider(
                                      //     value: valueHolder.toDouble(),
                                      //     min: 1,
                                      //     max: 100,
                                      //     divisions: 4,
                                      //     activeColor: Colors.green,
                                      //     inactiveColor: Colors.grey,
                                      //     // label: '${valueHolder.round()}',
                                      //     onChanged: (double newValue) {
                                      //       setState(() {
                                      //         valueHolder = newValue.round();
                                      //       });
                                      //     },
                                      //     semanticFormatterCallback: (double newValue) {
                                      //       return '${newValue.round()}';
                                      //     }
                                      // ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          "Why Main Court Asks For Your Skill Level?",
                                          style: TextStyle(
                                              color: AppColors.colorGray,
                                              fontSize: 13,
                                              fontFamily:
                                              'Poppins-Regular'),
                                        ),

                                        SizedBox(width: 5),
                                         //SizedBox(width: 20),
                                        InkWell(
                                          child:SvgPicture.asset(
                                              'assets/images/ic_info.svg') ,
                                          onTap: () => {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TermsCondition()))
                                          },
                                        ),

                                      ],
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    width: double.infinity,
                                    alignment: AlignmentDirectional.centerStart,
                                    height: 50,
                                    margin: const EdgeInsets.all(10),
                                  child:
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        shape:  RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                        ),
                                              backgroundColor: AppColors.colorGray,
                                              shadowColor: AppColors.appColor,
                                              textStyle:  TextStyle(
                                                  fontFamily: 'Poppins-Regular',
                                                  fontSize: 15
                                              )
                                          ),
                                    child: Padding(
                                    padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text('Rating Description',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.colorWhite,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  //   child: ElevatedButton(
                                  //     style: ElevatedButton.styleFrom(
                                  //         shape: const StadiumBorder(),
                                  //         backgroundColor: AppColors.colorGray,
                                  //
                                  //         shadowColor: AppColors.appColor,
                                  //         textStyle: const TextStyle(
                                  //             fontFamily: 'Poppins-Regular',
                                  //             fontSize: 15
                                  //         )
                                  //     ),
                                  //
                                  //     onPressed: () => {},
                                  //     child: Text("Rating Description"),
                                  // ),
                                  )

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ],
        )
        ),
      ),
    );
  }
}