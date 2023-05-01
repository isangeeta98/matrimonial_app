import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

import '../../models/membership_plan_response_model/get_add_on_plan_res_model.dart';
import '../../models/membership_plan_response_model/get_membership_plan_res_model.dart';

class GetMembershipPlanController extends GetxController{
  RxBool loading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  Rx<GetMemberShipPlanResModel> membershipplandata = GetMemberShipPlanResModel().obs;
  Rx<AddOnPlanResponseModel> addonplandata = AddOnPlanResponseModel().obs;

  @override

  void onInit() {
    super.onInit();
    getmembershiplandata(refresh: true);
    getaddonlandata(refresh: true);
  }

  void getmembershiplandata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-membership-plan');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      membershipplandata.value = GetMemberShipPlanResModel.fromJson(data);
    });
    // print(data);

    update();
  }


  void getaddonlandata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-addon-plans');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      addonplandata.value = AddOnPlanResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }

  void onRefresh() async {
    getmembershiplandata(refresh: true);
    getaddonlandata(refresh: true);
    refreshController.refreshCompleted();
  }

}