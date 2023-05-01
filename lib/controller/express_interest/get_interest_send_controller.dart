import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

import '../../elements/stringconstant.dart';
import '../../models/interest_send_response_model.dart';

class GetInterestSendController extends GetxController{
  RxBool loading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  String postToken = GetStorage().read(Constants.token);
  Rx<InterestSendResponseModel> interestsenddata = InterestSendResponseModel().obs;

  @override

  void onInit() {
    super.onInit();
    getinterestsenddata(refresh: true);
  }

  void getinterestsenddata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/express-interest/get-all');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization" : "Bearer $postToken"
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      interestsenddata.value = InterestSendResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }
}