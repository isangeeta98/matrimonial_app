import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../elements/stringconstant.dart';
import 'package:http/http.dart' as http;

import '../../helper/app_snackbar.dart';

class InterestSendController extends GetxController{
  RxBool loading = false.obs;
  String postToken = GetStorage().read(Constants.token);
  TextEditingController messageController = TextEditingController();


  Future sendinterestdata({required refresh, var senderid, var receverid}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/express-interest/store');
    var input =  {
      "ei_senderId":senderid,
      "ei_recieverId":receverid,
      "ei_message":"ei_message",
      "ei_status":"0"
    };
    final response =  await http.post(url,
      body: input,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer $postToken"
      },).
    then((response) {
      var data = jsonDecode(response.body);
      print(response.body);
      if (data["message"] == "Record add Successfully"){
        AppSnackbar.showSnackbar("Message", data["message"], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 3));
      //  educationdetaildata.value = EditEducationResModel.fromJson(data);
      }else {
        loading(false);
        AppSnackbar.showSnackbar("Error", data["message"], AlertType.error,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
      }
    });
    // print(data);
    update();
  }
}