import 'dart:convert';

import 'package:get/state_manager.dart';

import '../model/datamodel.dart';
import 'package:http/http.dart' as http;

import '../network/api.dart';

class ConversionRatesController extends GetxController {
  var isLoading = true.obs;

  var userdatamodellist = <Data>[].obs;

  @override
  void onInit() {
    super.onInit();
    getUserDataList();
  }

  void getUserDataList() async {
    try {
      isLoading(true);
      List<Data>? userdatalist = await APIServices.fetchSampleData();

      print("userdatalist=>${userdatalist.toString()}");
      if (userdatalist!.isNotEmpty) {
        userdatamodellist.value=userdatalist;
      }

    } finally {
      isLoading(false);
    }
  }
}