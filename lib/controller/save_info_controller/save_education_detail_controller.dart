import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../elements/stringconstant.dart';
import '../../helper/app_snackbar.dart';
import '../../models/drop_down_response_model/education_spec_response_model.dart';
import '../../models/save_personal_data_models/edit_education_detail_response_model.dart';

class SaveEducationDetailController extends GetxController{
  RxBool loading = false.obs;
  TextEditingController highereduController = TextEditingController();
  TextEditingController collegenameController = TextEditingController();
  TextEditingController occupationsecController = TextEditingController();
  TextEditingController occupationsplecController = TextEditingController();
  TextEditingController occupationtitleController = TextEditingController();
  TextEditingController workdesignationController = TextEditingController();
  TextEditingController organisationnameController = TextEditingController();
  TextEditingController highedumasterController = TextEditingController();
  TextEditingController boolController = TextEditingController();
  Rx<EditEducationResModel> educationdetaildata = EditEducationResModel().obs;
  String postToken = GetStorage().read(Constants.token);


  Future saveeducationaldetail({required refresh, var userid}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-education-details/store');
    var input =  {
      'u_edu_userId': userid,
      'u_edu_high_subcategroy': highereduController.text,
      'u_edu_high_category' : highedumasterController.text,
      'u_edu_college_name': collegenameController.text,
      'u_edu_occupation_sector': occupationsecController.text,
      'u_edu_occupation_specialization': occupationsplecController.text,
      'u_edu_occupation_title': occupationtitleController.text,
      'u_edu_work_destination': workdesignationController.text,
      'u_edu_organisation_name': organisationnameController.text,

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
        educationdetaildata.value = EditEducationResModel.fromJson(data);
      }else {
        loading(false);
        AppSnackbar.showSnackbar("Error", data["message"], AlertType.error,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
      }
    });
    // print(data);
    update();
  }



  // for edit the education detail data
  TextEditingController edithighereduController = TextEditingController();
  TextEditingController edithigheredusController = TextEditingController();
  TextEditingController editcollegenameController = TextEditingController();
  TextEditingController editoccupationsecController = TextEditingController();
  TextEditingController editoccupationsplecController = TextEditingController();
  TextEditingController editoccupationtitleController = TextEditingController();
  TextEditingController editworkdesignationController = TextEditingController();
  TextEditingController editorganisationnameController = TextEditingController();
  TextEditingController edithighedumasterController = TextEditingController();
  Future editeducationaldetail({required refresh, var userid}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-education-details/update');
    var input =  {
      'u_edu_userId': userid,
      'u_edu_high_subcategroy': edithighereduController.text,
      'u_edu_high_category' : edithighedumasterController.text,
      'u_edu_college_name': editcollegenameController.text,
      'u_edu_occupation_sector': editoccupationsecController.text,
      'u_edu_occupation_specialization': editoccupationsplecController.text,
      'u_edu_occupation_title': editoccupationtitleController.text,
      'u_edu_work_destination': editworkdesignationController.text,
      'u_edu_organisation_name': editorganisationnameController.text,

    };
    final response =  await http.patch(url,
      body: input,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      print(response.body);
      if (data["message"] == "Record Update Successfully"){
        AppSnackbar.showSnackbar("Message", data["message"], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 3));
        educationdetaildata.value = EditEducationResModel.fromJson(data);
      }else {
        loading(false);
        AppSnackbar.showSnackbar("Error", data["message"], AlertType.error,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
      }
    });
    // print(data);
    update();
  }



  Rx<EducationSpecResponseModel> educationspecdata = EducationSpecResponseModel().obs;
  Future geteducationspecdata({required refresh, var eduserid}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-education-field?ef_es_title=')
        .replace(queryParameters: {'ef_es_title': eduserid,});
    final response =  await http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": 'Bearer $postToken'
      },);
    var data = jsonDecode(response.body);
    print(response.body);
    educationspecdata.value = EducationSpecResponseModel.fromJson(data);

    // print(data);

    update();
  }
}