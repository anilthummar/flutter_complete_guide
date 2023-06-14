import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';

class MyRadioGroup extends StatefulWidget {
  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

enum GenederSelectionEnum { Male, Female, Prefer }

class RadioGroupWidget extends State<MyRadioGroup> {
  // Default Radio Button Selected Item When App Starts.
  int id = 1;
  GenederSelectionEnum _site = GenederSelectionEnum.Male;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              child: ListTile(
                title: const Text('Male',
                    style: TextStyle(
                      color: AppColors.colorGray,
                    )),
                leading: Radio(
                  fillColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.appColor),
                  focusColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.appColor),
                  activeColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.appColor),

                  value: GenederSelectionEnum.Male,
                  groupValue: _site,

                  onChanged: (value) => {
                    setState(() {
                      _site = value!;
                    }),
                  },
                ),
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              child: ListTile(
                title: const Text(
                  'Female',
                  style: TextStyle(color: AppColors.colorGray),
                ),
                leading: Radio(
                  fillColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.appColor),
                  focusColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.appColor),
                  value: GenederSelectionEnum.Female,
                  groupValue: _site,
                  onChanged: (value) => {
                    setState(() {
                      _site = value!;
                    }),
                  },
                ),
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              child: ListTile(
                selected: true,
                title: const Text(
                  'Prefer not to say',

                  style: TextStyle(color: AppColors.colorGray),
                ),
                leading: Radio(
                  fillColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.appColor),
                  focusColor: MaterialStateColor.resolveWith(
                          (states) => AppColors.appColor),
                  value: GenederSelectionEnum.Prefer,
                  groupValue: _site,
                  onChanged: (value) => {
                    setState(() {
                      _site = value!;
                    }),
                  },
                ),
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );


  }
}
