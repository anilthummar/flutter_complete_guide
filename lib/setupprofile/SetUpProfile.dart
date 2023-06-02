import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';
import 'package:flutter_complete_guide/HomeScreen.dart';
import 'package:flutter_complete_guide/utils/MyCustomButtonWidget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../MyRadioGroup.dart';
import '../intro_Screen/IntroSCreen.dart';
import '../intro_Screen/Intro_One.dart';
import '../intro_Screen/Intro_Three.dart';
import '../intro_Screen/Intro_Two.dart';
import '../utils/NumberStepper.dart';

class SetUpProfile extends StatefulWidget {
  const SetUpProfile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldDesignPageState createState() => _TextFieldDesignPageState();
}

class _TextFieldDesignPageState extends State<SetUpProfile> {
  final firstText = TextEditingController();
  final lastText = TextEditingController();
  final bioText = TextEditingController();
  final stateText = TextEditingController();
  final cityText = TextEditingController();
  final mobileText = TextEditingController();

  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNodeLastname = FocusNode();
  final FocusNode _focusNodeBioname = FocusNode();
  final FocusNode _focusNodeState = FocusNode();
  final FocusNode _focusNodeCity = FocusNode();

  // Color for border
  Color _borderColor = AppColors.colorGray;
  Color _borderColorLastname = AppColors.colorGray;
  Color _borderColorBio = AppColors.colorGray;
  Color _borderColorState = AppColors.colorGray;
  Color _borderColorCity = AppColors.colorGray;

  List<String> dropdownList = ['Flutter', 'Android', 'iOS'];
  String selectedDropdown = 'Flutter';
  String _selectedDate = 'Date of birth';
  String _selectcountry = 'Country';

  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

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

  @override
  void dispose() {
    super.dispose();
    lastText.dispose();
    firstText.dispose();
    mobileText.dispose();
    _focusNode.dispose();
    _focusNodeLastname.dispose();
    _focusNodeBioname.dispose();
    _focusNodeState.dispose();
    _focusNodeCity.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Change color for border if focus was changed
    _focusNode.addListener(() {
      setState(() {
        _borderColor =
            _focusNode.hasFocus ? AppColors.appColor : AppColors.colorGray;
      });
    });
    _focusNodeLastname.addListener(() {
      setState(() {
        _borderColorLastname = _focusNodeLastname.hasFocus
            ? AppColors.appColor
            : AppColors.colorGray;
      });
    });

    _focusNodeBioname.addListener(() {
      setState(() {
        _borderColorBio = _focusNodeBioname.hasFocus
            ? AppColors.appColor
            : AppColors.colorGray;
      });
    });

    _focusNodeState.addListener(() {
      setState(() {
        _borderColorState =
            _focusNodeState.hasFocus ? AppColors.appColor : AppColors.colorGray;
      });
    });

    _focusNodeCity.addListener(() {
      setState(() {
        _borderColorCity =
            _focusNodeCity.hasFocus ? AppColors.appColor : AppColors.colorGray;
      });
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
    );
    if (d != null) {
      setState(() {
        _selectedDate = DateFormat.yMMMMd("en_US").format(d);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: constraints.maxWidth,
                          minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Align(
                                              child: SvgPicture.asset(
                                                'assets/images/ic_back.svg',
                                              ),
                                            )),
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
                                                'Set Up Your Profile ',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    color: AppColors.btnColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(height: 20),
                                              // card view
                                              SizedBox(
                                                height: 160,
                                                width: 130,
                                                child: Card(
                                                  elevation: 0.5,
                                                  color: AppColors.borderColor,
                                                  child: InkWell(
                                                      onTap: () {
                                                        showCupertinoModalPopup(
                                                          context: context,
                                                          builder: (BuildContext
                                                              cont) {
                                                            return CupertinoActionSheet(
                                                              actions: [
                                                                CupertinoActionSheetAction(
                                                                  onPressed:
                                                                      () async {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: const Text(
                                                                      'Take a Photo',
                                                                      style:
                                                                          TextStyle(
                                                                        color: AppColors
                                                                            .colorGray,
                                                                        fontSize:
                                                                            15,
                                                                      )),
                                                                ),
                                                                CupertinoActionSheetAction(
                                                                  onPressed:
                                                                      () async {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    'Photo Gallery',
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppColors
                                                                          .colorGray,
                                                                      fontSize:
                                                                          15,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                              cancelButton:
                                                                  CupertinoActionSheetAction(
                                                                onPressed:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'Cancel',
                                                                  style:
                                                                      TextStyle(
                                                                    color: AppColors
                                                                        .colorGray,
                                                                    decorationColor:
                                                                        AppColors
                                                                            .colorGray,
                                                                    fontSize:
                                                                        15,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Align(
                                                        child: SvgPicture.asset(
                                                          'assets/images/ic_camera_plus.svg',
                                                        ),
                                                        // child: Image.network('https://picsum.photos/130/160'),
                                                      ),),
                                                ),
                                              ),

                                              const SizedBox(height: 20),
                                              // first name
                                              Container(
                                                height: 50,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: _borderColor),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  focusNode: _focusNode,
                                                  style: const TextStyle(
                                                    color: AppColors.btnColor,
                                                  ),
                                                  cursorColor:
                                                      AppColors.appColor,
                                                  controller: firstText,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: "First name",
                                                    border: InputBorder.none,
                                                    labelStyle: TextStyle(
                                                      color:
                                                          AppColors.colorGray,
                                                    ),
                                                    focusColor:
                                                        AppColors.appColor,
                                                    hintStyle: TextStyle(
                                                      color: AppColors.btnColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              //last name
                                              Container(
                                                height: 50,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          _borderColorLastname),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  focusNode: _focusNodeLastname,
                                                  style: const TextStyle(
                                                    color: AppColors.btnColor,
                                                  ),
                                                  cursorColor:
                                                      AppColors.appColor,
                                                  controller: lastText,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: "Last name",
                                                    border: InputBorder.none,
                                                    labelStyle: TextStyle(
                                                      color:
                                                          AppColors.colorGray,
                                                    ),
                                                    focusColor:
                                                        AppColors.appColor,
                                                    hintStyle: TextStyle(
                                                      color: AppColors.btnColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              //Picklist
                                              DropdownButtonFormField(
                                                iconEnabledColor:
                                                    AppColors.colorDropdown,
                                                icon: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  child: SvgPicture.asset(
                                                      "assets/images/drop_down.svg"),
                                                ),
                                                decoration:
                                                    const InputDecoration(
                                                  // labelText: "First name",

                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      style: BorderStyle.solid,
                                                      color:
                                                          AppColors.colorGray,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  disabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        style:
                                                            BorderStyle.solid,
                                                        color:
                                                            AppColors.colorGray,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        style:
                                                            BorderStyle.solid,
                                                        color:
                                                            AppColors.colorGray,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.all(10),
                                                  fillColor: Colors.white,
                                                  isDense: true,
                                                  labelStyle: TextStyle(
                                                    color: AppColors.colorWhite,
                                                  ),
                                                  focusColor:
                                                      AppColors.colorWhite,
                                                  hintStyle: TextStyle(
                                                    color: AppColors.colorWhite,
                                                  ),
                                                ),
                                                value: selectedDropdown,
                                                items: dropdownList
                                                    .map((String item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                          color: AppColors
                                                              .colorGray),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (dynamic value) {
                                                  setState(() {
                                                    selectedDropdown = value;
                                                  });
                                                },
                                              ),
                                              const SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: const [
                                                  Padding(
                                                    padding: EdgeInsets.all(1),
                                                    child: Text(
                                                      "Gender",
                                                      style: TextStyle(
                                                        color:
                                                            AppColors.colorGray,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              MyRadioGroup(),
                                              const SizedBox(height: 20),
                                              //DOB Picker
                                              InkWell(
                                                child: Container(
                                                  height: 50,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .colorGray),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          _selectedDate,
                                                          style: const TextStyle(
                                                              color: AppColors
                                                                  .btnColor),
                                                        ),
                                                      ),
                                                      Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 15,
                                                                  left: 10),
                                                          child: SvgPicture.asset(
                                                              "assets/images/ic_calender.svg")),
                                                    ],
                                                  ),
                                                ),
                                                onTap: () => {
                                                  _selectDate(context),
                                                },
                                              ),
                                              const SizedBox(height: 20),
                                              //Bio info
                                              Container(
                                                height: 190,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: _borderColorBio),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  focusNode: _focusNodeBioname,
                                                  style: const TextStyle(
                                                    color: AppColors.btnColor,
                                                  ),
                                                  cursorColor:
                                                      AppColors.appColor,
                                                  controller: bioText,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: "Bio",
                                                    border: InputBorder.none,
                                                    labelStyle: TextStyle(
                                                      color:
                                                          AppColors.colorGray,
                                                    ),
                                                    focusColor:
                                                        AppColors.appColor,
                                                    hintStyle: TextStyle(
                                                      color: AppColors.btnColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              // Tell us types of matches text
                                              const Text(
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                "Tell us the types of matches you are looking for.Your Bio will appear in your Player Profile.",
                                                style: TextStyle(
                                                    color: AppColors.colorGray,
                                                    fontSize: 15,
                                                    fontFamily:
                                                        'Poppins-Regular'),
                                              ),
                                              const SizedBox(height: 20),
                                              //Country pick list
                                              InkWell(
                                                child: Container(
                                                  height: 50,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .colorGray),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            child: Text(
                                                                "Country",
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .colorDropdown)),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            child: Text(
                                                              "United States of America",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .btnColor),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            right: 15,
                                                            left: 10),
                                                        child: SvgPicture.asset(
                                                            "assets/images/drop_down.svg"),
                                                        alignment: Alignment
                                                            .centerRight,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                onTap: () => {
                                                  _selectDate(context),
                                                },
                                              ),
                                              const SizedBox(height: 20),

                                              //city and state
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      height: 50,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                _borderColorCity),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(10),
                                                        ),
                                                      ),
                                                      child: TextFormField(
                                                        focusNode:
                                                            _focusNodeCity,
                                                        style: const TextStyle(
                                                          color: AppColors
                                                              .btnColor,
                                                        ),
                                                        cursorColor:
                                                            AppColors.appColor,
                                                        controller: cityText,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        decoration:
                                                            const InputDecoration(
                                                          labelText: "City",
                                                          border:
                                                              InputBorder.none,
                                                          labelStyle: TextStyle(
                                                            color: AppColors
                                                                .colorGray,
                                                          ),
                                                          focusColor: AppColors
                                                              .appColor,
                                                          hintStyle: TextStyle(
                                                            color: AppColors
                                                                .btnColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                    height: 50,
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              _borderColorState),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: TextFormField(
                                                      focusNode:
                                                          _focusNodeState,
                                                      style: const TextStyle(
                                                        color:
                                                            AppColors.btnColor,
                                                      ),
                                                      cursorColor:
                                                          AppColors.appColor,
                                                      controller: stateText,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        labelText: "State",
                                                        border:
                                                            InputBorder.none,
                                                        labelStyle: TextStyle(
                                                          color: AppColors
                                                              .colorGray,
                                                        ),
                                                        focusColor:
                                                            AppColors.appColor,
                                                        hintStyle: TextStyle(
                                                          color: AppColors
                                                              .btnColor,
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                                ],
                                              ),

                                              const SizedBox(height: 20),
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
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // bottomNavigationBar:
          // SizedBox(
          //   height: 80,
          //   child: Card(
          //     color: AppColors.colorWhite,
          //     elevation: 1,
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         NumberStepper(
          //           totalSteps: stepLength,
          //           width: 250,
          //           //MediaQuery.of(context).size.width,
          //           curStep: currentStep,
          //           stepCompleteColor: AppColors.appColor,
          //           currentStepColor: AppColors.colorDropdown,
          //           inactiveColor: AppColors.colorLine,
          //           lineWidth: 3.5,
          //         ),
          //         //Back Button
          //         Expanded(
          //           child: GestureDetector(
          //             onTap: currentStep == 1
          //                 ? null
          //                 : () {
          //                     back();
          //                   },
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 color: AppColors.appColor,
          //                 borderRadius: BorderRadius.circular(30),
          //               ),
          //               height: 40,
          //               width: 80,
          //               child: Padding(
          //                 padding: const EdgeInsets.all(1.5),
          //                 child: Container(
          //                   decoration: BoxDecoration(
          //                     color: AppColors.colorWhite,
          //                     borderRadius: BorderRadius.circular(30),
          //                   ),
          //                   child: Center(
          //                     child: Text('Back',
          //                       style:  TextStyle(color: AppColors.appColor),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //         //Next Button
          //         Expanded(
          //           child: GestureDetector(
          //               onTap: () {
          //                 next();
          //               },
          //               child: Container(
          //                 decoration: BoxDecoration(
          //                   color: AppColors.appColor,
          //                   borderRadius: BorderRadius.circular(30),
          //                 ),
          //                 height: 40,
          //                 width: 80,
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(1.5),
          //                   child: Container(
          //                     decoration: BoxDecoration(
          //                       color: AppColors.colorWhite,
          //                       borderRadius: BorderRadius.circular(35),
          //                     ),
          //                     child: Center(
          //                       child: Text(
          //                         currentStep == stepLength ? 'Finish' : 'Next',
          //                         style: const TextStyle(
          //                             color: AppColors.appColor),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               )
          //
          //               // child: Text(
          //               //   currentStep == stepLength ? 'Finish' : 'Next',
          //               //   style: const TextStyle(color: Colors.white),
          //               // ),
          //
          //               ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        );
      },
    );
  }
}

void _navigateToHomeScreen(BuildContext context, Widget homeScreen) {
  // Navigator.of(context)
  //     .push(MaterialPageRoute(builder: (context) => homeScreen));
}
