import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/AppColors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bottompages/events.dart';
import 'bottompages/explore.dart';
import 'bottompages/letsdink.dart';
import 'bottompages/matches.dart';
import 'bottompages/homepage.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Home_Screen();
}

class Home_Screen extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    List<Widget> _widgetOptions = <Widget>[

      HomePages(),
      Matches(),
      LetsDink(),
      Explore(),
      Events()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/images/home.svg',
              color: AppColors.appColor,
            ),
              icon :Padding(
                padding:  const EdgeInsets.only(bottom: 4.5),
                child: SvgPicture.asset('assets/images/home.svg',
                  color: AppColors.appColor,)
              ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/images/calendar.svg',
              color: AppColors.appColor,),
            icon :Padding(
                padding:  const EdgeInsets.only(bottom: 4.5),
                child: SvgPicture.asset('assets/images/calendar.svg',)
            ),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/images/letsdink.svg',
              color: AppColors.appColor,),
            icon :Padding(
                padding:  const EdgeInsets.only(bottom: 4.5),
                child: SvgPicture.asset('assets/images/letsdink.svg',)
            ),
            label: 'Let’s Dink!',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/images/explore.svg',
              color: AppColors.appColor,),
            icon :Padding(
                padding:  const EdgeInsets.only(bottom: 4.5),
                child: SvgPicture.asset('assets/images/explore.svg',)
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/images/events.svg',
              color: AppColors.appColor,),
            icon :Padding(
                padding:  const EdgeInsets.only(bottom: 4.5),
                child: SvgPicture.asset('assets/images/events.svg',)
            ),
            label: 'Events',
          ),

        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: AppColors.appColor,

        // unselectedItemColor: AppColors.colorGray,
        onTap: _onItemTapped,
      ),

    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}


