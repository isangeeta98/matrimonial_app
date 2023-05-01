import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

import '../../helper/app_snackbar.dart';
import '../../models/save_personal_data_models/edit_address_detail_res_model.dart';

class SaveAddressDetailController extends GetxController{
  RxBool loading = false.obs;
  TextEditingController useridController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pcountryController = TextEditingController();
  TextEditingController pstateController = TextEditingController();
  TextEditingController pcityController = TextEditingController();
  TextEditingController paddressController = TextEditingController();
  TextEditingController boolController = TextEditingController();
  Rx<AddressDetailResModel> addressdetaildata = AddressDetailResModel().obs;

  RefreshController refreshController = RefreshController(initialRefresh: false);

  Future saveaddressdetail({required refresh, bool? isvalue, var userid}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/address-details/store');
    var input =  {
      'a_user_id': userid,
      'a_country' : countryController.text,
      'a_state': stateController.text,
      'a_city': cityController.text,
      'a_address': addressController.text,
      'a_same_address': isvalue == true?"1":"0",
      'a_p_country': isvalue == true? countryController.text : pcountryController.text,
      'a_p_state': isvalue == true? stateController.text: pstateController.text,
      'a_p_city': isvalue == true ? cityController.text: pcityController.text,
      'a_p_address': isvalue == true ? addressController.text: paddressController.text,
    };
    final response =  await http.post(url,
      body: input,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      print(response.body);
      if (data["message"] == "Record add Successfully"){
        AppSnackbar.showSnackbar("Message", data["message"], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 3));
        addressdetaildata.value = AddressDetailResModel.fromJson(data);
      }else if(data["message"] == "Record Update Successfully"){
        AppSnackbar.showSnackbar("Message", data["message"], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 3));
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
    saveaddressdetail(refresh: true);
    refreshController.refreshCompleted();
  }
}