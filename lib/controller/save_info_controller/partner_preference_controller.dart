import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meetmeapp/controller/auth_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;
import '../../elements/stringconstant.dart';
import '../../helper/app_snackbar.dart';
import '../../helper/network/endpoints.dart';
import '../../helper/network/network_manager.dart';
import '../../models/save_personal_data_models/partner_pref_res_model.dart';

class PartnerPreferenceController extends GetxController{
  RxBool loading = false.obs;
  TextEditingController religionController = TextEditingController();
  TextEditingController casteController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController residencialController = TextEditingController();
  TextEditingController incomeController = TextEditingController();
  TextEditingController agetoController = TextEditingController();
  TextEditingController agefromController = TextEditingController();
  TextEditingController maritalstatusController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  RefreshController refreshController = RefreshController(initialRefresh: false);
  Rx<PartnerPreferenceResModel> partnerprefdetaildata = PartnerPreferenceResModel().obs;
  String postToken = GetStorage().read(Constants.token);
 // String postToken = "${Get.find<AuthController>().loginResponseData.value.userToken}";


  Future savepartnerpreferncedetail({required refresh, var userid,
  var educat, var reli, var residet, var pincome}) async {
    List<String> religiondata = [religionController.text];
    List<String> castdata = [casteController.text];
    List<String> educationdaat = [educationController.text];
    List<String> residntdata = [residencialController.text];
    List<String> maritaldata = [maritalstatusController.text];
    List<String> professiondata = [professionController.text];
    final url = Uri.parse('http://65.2.137.114:5000/api/front/partner-perference-details/store');
    var input =  {
      "user_id" : userid,
      'religion' : religiondata,
      'caste': castdata,
      'eduction': educationdaat,
      'residencial': residntdata,
      'income_range': incomeController.text == ""? pincome:incomeController.text,
      'age_to': agetoController.text,
      'age_from': agefromController.text,
      'marital_status': maritaldata,
      "profession" : professiondata
    };
    final response =  await http.post(url,
      body: json.encode(input),
      headers: {
        'Content-Type': 'application/json',
        //"Content-Type": "application/x-www-form-urlencoded",
        "Authorization": 'Bearer $postToken'
      },);
    var data = jsonDecode(response.body);
    //var data = response.body;
    print(response.body);
    if (data["message"] == "Record add Successfully"){
      partnerprefdetaildata.value = PartnerPreferenceResModel.fromJson(data);
      AppSnackbar.showSnackbar("Message", data["message"], AlertType.success,
          position: SnackPosition.TOP, duration: const Duration(seconds: 3));
    }else {
      loading(false);
      AppSnackbar.showSnackbar("Error", data["message"], AlertType.error,
          position: SnackPosition.TOP, duration: const Duration(seconds: 2));
    }
    //print(data);

    update();
  }



  // edit partner preference
  TextEditingController editreligionController = TextEditingController();
  TextEditingController editcasteController = TextEditingController();
  TextEditingController editeducationController = TextEditingController();
  TextEditingController editresidencialController = TextEditingController();
  TextEditingController editincomeController = TextEditingController();
  TextEditingController editagetoController = TextEditingController();
  TextEditingController editagefromController = TextEditingController();
  TextEditingController editmaritalstatusController = TextEditingController();
  TextEditingController editprofessionController = TextEditingController();
  Future editpartnerpreferncedetail({required refresh, var userid,
    var educat, var reli, var residet, var pincome}) async {
    List<String> editreligiondata = [editreligionController.text];
    List<String> editcastdata = [editcasteController.text];
    List<String> editeducationdaat = [editeducationController.text];
    List<String> editresidntdata = [editresidencialController.text];
    List<String> editmaritaldata = [editmaritalstatusController.text];
    List<String> editprofessiondata = [editprofessionController.text];
    var editinput = {
      "user_id" : userid,
      'religion' : editreligiondata,
      'caste': editcastdata,
      'eduction': editeducationdaat,
      'residencial': editresidntdata,
      'income_range': editincomeController.text == ""? pincome:editincomeController.text,
      'age_to': editagetoController.text,
      'age_from': editagefromController.text,
      'marital_status': editmaritaldata,
      "profession" : editprofessiondata
    };
    final url = Uri.parse('http://65.2.137.114:5000/api/front/partner-perference-details/update');
    final response =  await http.patch(url,
      body: json.encode(editinput),
      headers: {
      'Content-Type': 'application/json',
        //"Content-Type": "application/x-www-form-urlencoded",
        "Authorization": 'Bearer $postToken'
      },);
    var data = jsonDecode(response.body);
    //var data = response.body;
    print(response.body);
    // var headers = {
    //   'Authorization': 'Bearer $postToken',
    //   'Content-Type': 'application/json'
    // };
    // var request = http.Request('PATCH',
    //     Uri.parse('http://65.2.137.114:5000/api/front/partner-perference-details/update'));
    // request.body = json.encode({
    //   "user_id": userid,
    //   "religion": [editreligiondata],
    //   "caste": [editcasteController],
    //   "eduction": [editeducationController],
    //   "residencial": [editresidencialController ],
    //   "income_range": editincomeController.text == ""? pincome:editincomeController.text,
    //   "age_to": editagetoController.text,
    //   "age_from":  editagefromController.text,
    //   "marital_status": [
    //    editmaritalstatusController],
    //   "profession": [
    //    editprofessionController
    //   ]
    // });
    if (data["message"] == "Record Update Successfully"){
      partnerprefdetaildata.value = PartnerPreferenceResModel.fromJson(data);
      AppSnackbar.showSnackbar("Message", data["message"], AlertType.success,
          position: SnackPosition.TOP, duration: const Duration(seconds: 3));
    }else {
      loading(false);
      AppSnackbar.showSnackbar("Error", data["message"], AlertType.error,
          position: SnackPosition.TOP, duration: const Duration(seconds: 2));
    }
    //print(data);

    update();
  }

  void onRefresh() async {
    savepartnerpreferncedetail(refresh: true);
    refreshController.refreshCompleted();
  }
}