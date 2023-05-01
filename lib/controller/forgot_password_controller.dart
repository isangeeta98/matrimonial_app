import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meetmeapp/views/forgot_password/forgot_password_screen2.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

import '../helper/app_snackbar.dart';

class ForgotPasswordController extends GetxController{
  RxBool loading = false.obs;
  TextEditingController emailidController = TextEditingController();
  RefreshController refreshController = RefreshController(initialRefresh: false);

  // registration api
  void getforgotpassword({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/reset/password/email');
   // final url = Uri.parse('http://192.168.1.8:5000/api/front/reset/password/email');
    final response =  http.post(url,
      body: {'email': emailidController.text,},
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    //var response =  NetworkManager.instance.getDio().post(Endpoints.register, data: input).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      if (data["sucess"] == true){
        // var otpData = data['data']['otp'];
        // var userId = data['data']['id'];
        AppSnackbar.showSnackbar("Message", data["message"], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 4));
        emailidController.clear();
        Get.off(()=>  ForgotPasswordScreen2());
      }else {
        loading(false);
        AppSnackbar.showSnackbar("Error", data["message"], AlertType.error,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
      }
    });
    // print(data);

    update();
  }

  void onRefresh() async {
    getforgotpassword(refresh: true);
    refreshController.refreshCompleted();
  }
}