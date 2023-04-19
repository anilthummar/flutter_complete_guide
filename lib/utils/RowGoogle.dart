import 'package:flutter/material.dart';
import 'AppColors.dart';
import '../SendOtp.dart';

class RowGoogle extends StatelessWidget{
  const RowGoogle({super.key});


  @override
  Widget build(BuildContext context) {

    return Center(
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.colorWhite,
        child: IconButton(
          icon: Image.asset('assets/images/ic_google.png'),
          color: AppColors.borderColor,
          onPressed: () => {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SendOtpScreen()))
          },
        ),
      ),
    );

  }
}

class RowApple extends StatelessWidget{
  const RowApple({super.key});


  @override
  Widget build(BuildContext context) {

    return Center(
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.colorWhite,
        child: IconButton(
          icon: Image.asset('assets/images/ic_apple.png'),
          color: AppColors.borderColor,
          onPressed: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SendOtpScreen()))
            // ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
            //   content: Text("You click on applw button"),
            // )),
          },
        ),
      ),
    );

  }
}

class RowFaceBook extends StatelessWidget{
  const RowFaceBook({super.key});


  @override
  Widget build(BuildContext context) {

    return Center(
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.colorWhite,
        child: IconButton(
          icon: Image.asset('assets/images/ic_facebook.png'),
          color: AppColors.borderColor,
          onPressed: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SendOtpScreen()))
            // ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
            //   content: Text("You click on facebook button"),
            // )),
          },
        ),
      ),
    );

  }
}