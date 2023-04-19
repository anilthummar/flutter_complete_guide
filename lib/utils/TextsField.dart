import 'package:flutter/material.dart';

class TextsField extends StatelessWidget{
  const TextsField({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: const Text("App Bar")),
    body: Center(
      child: Column(
        children:const <Widget>[

          Text(
                "This is a Text Widget",
                style: TextStyle(
                fontSize: 20,
                color: Color(0xff00923A),
          )),
          Text(
              "This is a Text Widget",
               style: TextStyle(
                 fontFamily: 'Poppins-Regular',
                 fontSize: 25,
                 color: Color(0xff4254cc),
               ), ),
          Text(
            "This is a Text Widget",
            style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 30,
              color: Color(0xffc61fcc),
            ), ),

          Text("This is a Text Widget",
          style: TextStyle(
            letterSpacing: 1,
            wordSpacing:2,
            fontSize: 30
          ),
          ),

        ],
      ),

    ),
    );


  }

  showData() {

  }
}