import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/datamodel.dart';

class APIServices {

  static Future<List<Data>?> fetchSampleData() async {

    var userdatamodellist = <Data>[];
    var dio = Dio();

    dio.options.headers['app-id'] = '6218809df11d1d412af5bac4';
     var dummyapiresponse = await dio.get(
        'http://dummyapi.io/data/v1/user',);

    if (dummyapiresponse.statusCode == 200) {
      var jsonDEcode = jsonDecode(dummyapiresponse.toString())['data'];
      print("userdatamodellist response=> $jsonDEcode");
      for (var i in jsonDEcode) {
        print("userdatamodellist=> ${Data.fromJson(i)}");
        userdatamodellist.add(Data.fromJson(i));
      }

      return userdatamodellist;
    }
  }
}
