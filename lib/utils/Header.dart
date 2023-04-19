import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginHeaders extends StatelessWidget {
  const LoginHeaders({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          // Image.asset('assets/images/ic_logo_splash.png', scale: 8.0),
          SvgPicture.asset('assets/images/ic_app_logo.svg',),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class Introone extends StatelessWidget {
  const Introone({super.key});


  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/ic_intro_one.png',
      height: 250,
      width: double.maxFinite,
      fit: BoxFit.cover,
      );
  }
}

class LoginHeaderBackImage extends StatelessWidget {
  const LoginHeaderBackImage({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * 0.15,
        //     child: Align(
        //      child :Image.asset('assets/images/ic_back_arrow.png'),)
        // ),

        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please go back/")),);
            },
              child:
              Align(
                  child: SvgPicture.asset('assets/images/ic_back.svg',),),
          ),
        ),


        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          alignment: Alignment.center,
            child: Align(
              child :Image.asset('assets/images/ic_logo_splash.png',scale: 7.0,),)
        ),
      ],
    );
  }
}


class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          // Image.asset('assets/images/ic_logo_splash.png', scale: 8.0),
          // const SizedBox(height: 15),
          Align(alignment: Alignment.centerLeft,
            child :Image.asset('assets/images/ic_back_arrow.png'),
          ),
        ],
      ),
    );
  }
}
