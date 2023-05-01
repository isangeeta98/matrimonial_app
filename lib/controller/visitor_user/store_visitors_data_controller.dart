import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../elements/stringconstant.dart';
import 'package:http/http.dart' as http;

import '../../helper/app_snackbar.dart';

class StoreVisitorDataController extends GetxController{
  RxBool loading = false.obs;
  String postToken = GetStorage().read(Constants.token);

  //@override
  //
  // void onInit() {
  //   super.onInit();
  //   storevisitordata(refresh: true);
  // }

  Future storevisitordata({required refresh, var myid, var visitorid}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/visitors-user');
    var input =  {
      "myId":myid,
      "visitor_id":visitorid,
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
      // if (data["status"] == 200){
      //   AppSnackbar.showSnackbar("Message", "Record add Successfully", AlertType.success,
      //       position: SnackPosition.TOP, duration: const Duration(seconds: 3));
      //   //  educationdetaildata.value = EditEducationResModel.fromJson(data);
      // }else {
      //   loading(false);
      //   AppSnackbar.showSnackbar("Error", data["message"], AlertType.error,
      //       position: SnackPosition.TOP, duration: const Duration(seconds: 2));
      // }
    });
    // print(data);
    update();
  }
}