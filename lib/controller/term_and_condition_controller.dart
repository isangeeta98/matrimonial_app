import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

import '../models/privacy_policy_response_model.dart';
import '../models/term_and_condition_response_model.dart';

class TermAndConditionController extends GetxController{
  RxBool loading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  Rx<Termandconditionresmodel> termandconditiondata = Termandconditionresmodel().obs;
  Rx<PrivacyPolicyResponseModel> privacypolicydata = PrivacyPolicyResponseModel().obs;

  @override

  void onInit() {
    super.onInit();
    gettermandconditiondata(refresh: true);
    getprivacypolicydata(refresh: true);
  }

  // slider api
  void gettermandconditiondata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/admin-panel/term-condition/get-by-id');
    //final url = Uri.parse('http://192.168.1.8:5000/api/admin-panel/term-condition/get-by-id');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      termandconditiondata.value = Termandconditionresmodel.fromJson(data);
    });
    // print(data);

    update();
  }


  void getprivacypolicydata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/admin-panel/privacy/get-by-id');
    //final url = Uri.parse('http://192.168.1.8:5000/api/admin-panel/term-condition/get-by-id');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      privacypolicydata.value = PrivacyPolicyResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }

  void onRefresh() async {
    gettermandconditiondata(refresh: true);
    getprivacypolicydata(refresh: true);
    refreshController.refreshCompleted();
  }
}