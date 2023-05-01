import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart' as dio;
import '../elements/stringconstant.dart';
import '../helper/app_manager.dart';
import '../helper/app_snackbar.dart';
import '../helper/network/endpoints.dart';
import '../helper/network/network_manager.dart';
import '../models/login_response_model.dart';
import '../views/home_tabbar_screen.dart';
import '../views/login_screen.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController{
  RxInt currentIndex = 0.obs;
  RxBool loading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  Rx<LoginResponseModel> loginResponseData = LoginResponseModel().obs;
  TextEditingController emailidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onRefresh() async {
    refreshController.refreshCompleted();
  }

  // Api login user
  void loginUser()  async{
    //final url = Uri.parse('http://13.127.179.199:5000/api/front/login');
   // final url = Uri.parse('http://192.168.1.8:5000/api/front/login');
    loading(true);
    // final response =  http.post(url,
    //   body: {'email': emailidController.text,
    //          'password':passwordController.text},
    //   headers: {
    //   "Content-Type": "application/x-www-form-urlencoded",
    // },).
    //NetworkManager.instance.options.headers["Content-Type"] = "application/x-www-form-urlencoded";
    // dio.FormData formData = dio.FormData.fromMap({
    //   'email': emailidController.text,
    //   'password':passwordController.text
    // });
    var response = await NetworkManager.instance.getDio().post(Endpoints.login,
      data:  {'email': emailidController.text,
                 'password':passwordController.text},
    ).then((response) async{
      var data = response.data;
      print(response.data);
      if (data["message"] == "Login Successfully") {
        loginResponseData.value = LoginResponseModel.fromJson(data);
        var resdata = data;
        print(resdata);
        try{
          // if (response.data['data']['errorList'] == []) {
          final getBox = GetStorage();
          getBox.write(Constants.token,  data["userToken"]);
          //getBox.write(Constants.userNameSaved, data['name']);
          AppManager.statusHelper.setLoginStatus(true);
          //storeLoginModel(loginResponseData.value);
          emailidController.clear();
          passwordController.clear();
          AppSnackbar.showSnackbar("Success", ("Login Successfully"), AlertType.success,
              position: SnackPosition.TOP, duration: const Duration(seconds: 2));
          Get.offAll(()=> HomeTabsScreen());
          //AppManager.statusHelper.getLoginStatus ? const PreDashboardScreen() : LoginScreen();
          //}
        }catch(e){
          AppSnackbar.showSnackbar("Error", ("Login Failed"), AlertType.error,
              position: SnackPosition.TOP, duration: const Duration(seconds: 2));
        }
      }  else {
        loading(false);
        AppSnackbar.showSnackbar("Error", "${response.data["message"]}", AlertType.error,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
      }
    }).onError((dio.DioError error, stackTrace) async {
      loading(false);
      AppSnackbar.showSnackbar("Error", '${error.response?.data['message']}', AlertType.error);
    });
  }

  final getBox = GetStorage();
  // void storeLoginModel(LoginResponseModel model) {
  //   getBox.write('loginRes', model.toJson());
  // }
  //
  // LoginResponseModel restoreLoginModel() {
  //   final map = getBox.read('loginRes');
  //   LoginResponseModel data = LoginResponseModel();
  //   if(map != null){
  //     data = LoginResponseModel.fromJson(map);
  //   }else{
  //     data = LoginResponseModel();
  //   }
  //   return data;
  //
  // }

  signOut() async {
    AppManager.statusHelper.setLoginStatus(false);
    await GetStorage().erase();
    Get.offAll(() =>  const LoginScreen());
  }
}