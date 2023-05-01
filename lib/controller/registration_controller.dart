import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meetmeapp/views/login_screen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../helper/app_snackbar.dart';
import '../helper/network/endpoints.dart';
import '../helper/network/network_manager.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController{
  RxBool loading = false.obs;
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController middlenameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController ipaddressController = TextEditingController();
  TextEditingController profilecrateforController = TextEditingController();
  TextEditingController accepttermandconController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  RefreshController refreshController = RefreshController(initialRefresh: false);

  // registration api
  void getRegisterdata({required refresh}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/sign-up/');

    //final url = Uri.parse('http://192.168.1.8:5000/api/front/sign-up/');
    final response = await http.post(url,
        body: {'email': emailController.text,
          'password' : passwordController.text,
          'fristname': fullnameController.text,
          'middlename': middlenameController.text,
          'lastname': lastnameController.text,
          'mobile': mobileController.text,
          'ipAddress': ipaddressController.text,
          'profile_create_for': profilecrateforController.text,
          'accept_term_condition': accepttermandconController.text,
          'DOB': dobController.text,
          'gender': genderController.text
        },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    //var response =  NetworkManager.instance.getDio().post(Endpoints.register, data: input).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      if (data["message"] == "Your Account Create Successfully"){
        // var otpData = data['data']['otp'];
        // var userId = data['data']['id'];
        AppSnackbar.showSnackbar("Message", data["message"], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 9));
        emailController.clear();
        mobileController.clear();
        fullnameController.clear();
        passwordController.clear();
        middlenameController.clear();
        lastnameController.clear();
        profilecrateforController.clear();
        accepttermandconController.clear();
        dobController.clear();
        Get.offAll(()=>  LoginScreen());
      }else {
        loading(false);
        if(data["message"] == "E11000 duplicate key error collection: test.users index: mobile_1 dup key: { mobile: \"${mobileController.text}\" }"){
          AppSnackbar.showSnackbar("Error", "Mobile no. already exist", AlertType.error,
              position: SnackPosition.TOP, duration: const Duration(seconds: 2));
        }else if(data["message"] ==  "E11000 duplicate key error collection: test.users index: email_1 dup key: { email: \"${emailController.text}\" }"){
          AppSnackbar.showSnackbar("Error", "Email already exist", AlertType.error,
              position: SnackPosition.TOP, duration: const Duration(seconds: 2));
        }

      }
    });
   // print(data);

    update();
  }

  void onRefresh() async {
     getRegisterdata(refresh: true);
    refreshController.refreshCompleted();
  }

}