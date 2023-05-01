import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmeapp/helper/app_snackbar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

import '../views/forgot_password/passowrd_scuccess_screen.dart';

class ResetPasswordController extends GetxController{
  RxBool loading = false.obs;
  TextEditingController emailidController = TextEditingController();
  TextEditingController newpasswordCon = TextEditingController();
  TextEditingController confirmpasswordCon = TextEditingController();
  TextEditingController tokenController = TextEditingController();
  RefreshController refreshController = RefreshController(initialRefresh: false);

  void getresetpassword({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/reset/password');
    //final url = Uri.parse('http://192.168.1.8:5000/api/front/reset/password');
    final response =  http.patch(url,
      body: {'email': emailidController.text,
              'new_passowrd' : newpasswordCon.text,
              'confirm_password' : confirmpasswordCon.text,
              'reset_password_token' : tokenController.text,
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    //var response =  NetworkManager.instance.getDio().post(Endpoints.register, data: input).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      if (data['message'] == "password reset Successfully"){
        // var otpData = data['data']['otp'];
        // var userId = data['data']['id'];
        AppSnackbar.showSnackbar("Message", data['message'], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 4));
        emailidController.clear();
        newpasswordCon.clear();
        confirmpasswordCon.clear();
        tokenController.clear();
        Get.off(()=>  PasswordChangeSuccessScreen());
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
    getresetpassword(refresh: true);
    refreshController.refreshCompleted();
  }
}