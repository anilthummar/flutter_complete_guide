import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../privacy_pages/terms_conditions.dart';
import 'CustomSlider.dart';

class SetUpProfileTwo extends StatefulWidget {
  const SetUpProfileTwo({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldDesignPageState createState() => _TextFieldDesignPageState();
}

class _TextFieldDesignPageState extends State<SetUpProfileTwo> {
  var _ratingController = TextEditingController();
  double _rating = 0.0;
  int _ratingBarMode = 1;
  IconData? _selectedIcon;

  int valueHolder = 0;

  double value = 1;
  double actualValue = 5;
  double minValue = 0;
  double maxValue = 5;

  // List<double> steps = [0,5,10,15,20,25,30,35,40,45,50,60,70,80,90,100];
  // List<double> steps = [0, 5, 10, 15, 20, 25];
  List<double> steps = [1,2,3,4,5];

  late int _currentPage;
  late int _itemsPerPage;

  bool isVisible = false;

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
            child: Stack(
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
                              width: MediaQuery.of(context).size.width * 0.75,
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
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // card view
                                  const SizedBox(height: 20),
                                  // Tell us types of matches text
                                  const SizedBox(height: 20),
                                  RatingBar(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    itemPadding: EdgeInsets.all(10),
                                    allowHalfRating: true,
                                    onRatingUpdate: (value) {
                                      print("RatingBar_: $value");
                                      // _rating=valueHolder.round() as double;
                                      // _rating = value;
                                    },
                                    ratingWidget: RatingWidget(
                                      full: SvgPicture.asset(
                                        'assets/images/ic_full_border.svg',
                                        color: AppColors.colorYellow,
                                      ),
                                      half: SvgPicture.asset(
                                        'assets/images/ic_half_border.svg',
                                        color: AppColors.colorLine,
                                      ),
                                      empty: SvgPicture.asset(
                                        'assets/images/ic_empty_border.svg',
                                        color: AppColors.colorLine,
                                      ),
                                    ),
                                    itemCount: 5,
                                  ),
                                  const SizedBox(height: 10),
                                  // Rating bar view
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: CustomSlider(
                                      minValue: minValue,
                                      maxValue: maxValue,
                                      value: value,
                                      majorTick: 5,
                                      minorTick: 1,
                                      labelValuePrecision: 0,
                                      tickValuePrecision: 0,
                                      onChanged: (val) => setState(() {
                                        value = val;
                                        print("objectvalue_:$value");
                                        actualValue = steps[(val /
                                                maxValue *
                                                (steps.length - 1))
                                            .ceil()
                                            .toInt()];
                                        print('Slider value (linear): $value');
                                        print(
                                            'Actual value (non-linear): $actualValue');
                                        _rating = actualValue;
                                        if ((_rating == 1 && _rating == 1.0) ||
                                            (_rating == 2 && _rating == 2.0) ||
                                            (_rating == 3 && _rating == 3.0) ||
                                            (_rating == 4 && _rating == 4.0) ||
                                            (_rating == 5 && _rating == 5.0)) {
                                          setState(() {
                                            if (isVisible == false) {
                                              isVisible = true;
                                            } else {
                                              isVisible = false;
                                            }
                                          });
                                        } else {
                                          isVisible = false;
                                        }
                                      }),
                                      activeColor: AppColors.colorYellow,
                                      // inactiveColor: Colors.orange.shade50,
                                      linearStep: false,
                                      steps: steps,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(1),
                                        child: Text(
                                          "${_rating.toInt()}",
                                          style: TextStyle(
                                            color: AppColors.btnColor,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
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
                                            fontFamily: 'Poppins-Regular'),
                                      ),

                                      SizedBox(width: 5),
                                      //SizedBox(width: 20),
                                      InkWell(
                                        child: SvgPicture.asset(
                                            'assets/images/ic_info.svg'),
                                        onTap: () => {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const TermsCondition()))
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Container1(isVisible,_rating),
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
        )),
      ),
    );
  }
}

Container1(bool isVisible, double rating) {
  return Column(
    children: [
     Card(
       elevation: 1.5,
       child: Column(
         children: [
           Container(
             width: double.infinity,
             alignment: AlignmentDirectional.centerStart,
             height: 50,
             margin: const EdgeInsets.only(left: 5,right: 5),
             child: ElevatedButton(
               onPressed: () {},
               style: ElevatedButton.styleFrom(
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(10))),
                   backgroundColor: AppColors.colorGray,
                   shadowColor: AppColors.appColor,
                   textStyle:
                   TextStyle(fontFamily: 'Poppins-Regular', fontSize: 15)),
               child: Padding(
                 padding: EdgeInsets.all(10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Text(
                       'Rating Description $rating',
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
           ),
           Visibility(
             // showing the child widget
             visible: isVisible,
             child: Container(
               padding: const EdgeInsets.only(left: 10,bottom: 10,right: 10),
               width: double.infinity,
               child: const Text(
                 AppColors.rating_description,
                 style: TextStyle(
                     fontSize: 13,
                     color: AppColors.btnColor,
                     fontWeight: FontWeight.bold),
               ),
             ),
           )
         ],
       ),
     )
    ],
  );
}

class Pages extends StatelessWidget {
  final text;

  Pages({this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ]),
    );
  }
}
