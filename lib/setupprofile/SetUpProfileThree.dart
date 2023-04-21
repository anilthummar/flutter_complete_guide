import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';
import 'package:flutter_svg/svg.dart';

class SetUpProfileThree extends StatefulWidget {
  const SetUpProfileThree({Key? key}) : super(key: key);

  @override
  _TextFieldDesignPageState createState() => _TextFieldDesignPageState();
}

class _TextFieldDesignPageState extends State<SetUpProfileThree> {
  final List<Map<String, dynamic>> _allHomeClubListData = [
    {"id": 1, "name": "AFL Green Lawns", "isSelected": false},
    {"id": 2, "name": "Eulalia AFL Green Lawns", "isSelected": false},
    {"id": 3, "name": "AFL Green Lawns", "isSelected": false},
    {"id": 4, "name": "Green Lawns", "isSelected": false},
    {"id": 5, "name": "Eulalia AFL Green Lawns", "isSelected": false},
    {"id": 6, "name": "Jasper AFL Green Lawns", "isSelected": false},
    {"id": 7, "name": "Jasper", "isSelected": false}
  ];
  List<Map<String, dynamic>> _homeClubList = [];
  TextEditingController mController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _homeClubList = _allHomeClubListData;
  }

  @override
  void dispose() {
    super.dispose();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allHomeClubListData;
    } else {
      results = _allHomeClubListData
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _homeClubList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 15),
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
                        child:
                            SvgPicture.asset('assets/images/ic_app_logo.svg'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Home Club',
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColors.btnColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    cursorColor: AppColors.colorGray,
                    onChanged: (value) => _runFilter(value),
                    controller: mController,
                    decoration: InputDecoration(
                      hintText: "Search Home Club",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.appColor,
                        ),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.colorGray,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.appColor,
                        ),
                      ),
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: AppColors.colorGray,
                        ),
                        onPressed: () {},
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: AppColors.colorGray,
                        ),
                        onPressed: () {
                          mController.clear();
                          _runFilter("");
                          for (var element in _homeClubList) {
                            element['isSelected'] = false;
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: _homeClubList.isNotEmpty
                        ? ListView.separated(
                            itemCount: _homeClubList.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                              height: 2,
                              color: AppColors.colorGray,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                onTap: () {
                                  for (var element in _homeClubList) {
                                    if (element['isSelected'] == true) {
                                      element['isSelected'] = false;
                                    }
                                  }
                                  setState(() {
                                    if (_homeClubList[index]['isSelected'] !=
                                        true) {
                                      mController.text = _homeClubList[index]
                                              ['name']
                                          .toString();
                                    } else {
                                      mController.text = "";
                                    }
                                    _homeClubList[index]['isSelected'] =
                                        !_homeClubList[index]['isSelected'];
                                  });
                                },
                                title: Text(
                                  _homeClubList[index]['name'],
                                  style: TextStyle(
                                    color: _homeClubList[index]['isSelected']
                                        ? AppColors.appColor
                                        : AppColors.colorBlack,
                                  ),
                                ),
                              );
                            },
                          )
                        : const Text(
                            'No results found',
                            style: TextStyle(fontSize: 20),
                          ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Your Home Club Not Available?\n",
                          style: TextStyle(
                            color: AppColors.colorGray,
                            fontSize: 15,
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                        TextSpan(
                          text: "Add Home Club",
                          style: const TextStyle(
                              height: 2.5,
                              color: AppColors.appColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              fontSize: 15),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // move to location map search screen
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
