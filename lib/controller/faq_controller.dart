import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

import '../models/faq_response_model.dart';

class FaqController extends GetxController{
  RxBool loading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  Rx<Faqresponsemodel> faqdata = Faqresponsemodel().obs;
  @override

  void onInit() {
    super.onInit();
    getfaqdata(refresh: true);
  }

  // slider api
  void getfaqdata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/admin-panel/faq/index?page=1&show=10&search=blog 1');
    //final url = Uri.parse('http://192.168.1.8:5000/api/admin-panel/faq/index?page=1&show=10&search=blog 1');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      faqdata.value = Faqresponsemodel.fromJson(data);
    });
    // print(data);

    update();
  }

  void onRefresh() async {
    getfaqdata(refresh: true);
    refreshController.refreshCompleted();
  }
}