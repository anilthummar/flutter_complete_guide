import 'package:flutter/material.dart';

class ReverseString{
  var strSTring ="Anil";
  int strLenght=0;


  String strResult=getReverseString("Hello");

}

String getReverseString(var str) {
  var reversedStr = "";
  var index = str.length - 1; // 5-1 ==4

  while (index >= 0) { //4
    reversedStr += str[index];
    index--;
  }

  print("reversedStr: $reversedStr");

  return reversedStr;

// 4 >=0 =Yes => o 3
//3 >=0 =Yes => l 2
//2 >=0 =Yes => l 1
//1 >=0 =Yes => e 0
//0 >=0 =Yes => h -1

}