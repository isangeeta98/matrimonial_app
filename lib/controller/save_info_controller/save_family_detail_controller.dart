import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

import '../../helper/app_snackbar.dart';
import '../../models/save_personal_data_models/edit_family_data_res_model.dart';

class SaveFamilyDetailController extends GetxController{
  RxBool loading = false.obs;
  TextEditingController useridController = TextEditingController();
  TextEditingController fathernameController = TextEditingController();
  TextEditingController fathergotraController = TextEditingController();
  TextEditingController fatheroccupController = TextEditingController();
  TextEditingController fatheroccupstatusController = TextEditingController();
  TextEditingController mothernameController = TextEditingController();
  TextEditingController motherparentController = TextEditingController();
  TextEditingController mothergotraController = TextEditingController();
  TextEditingController familystatusController = TextEditingController();
  TextEditingController familytypeController = TextEditingController();
  TextEditingController familyvalueController = TextEditingController();
  TextEditingController sisterController = TextEditingController();
  TextEditingController sistermarriedController = TextEditingController();
  TextEditingController brotherController = TextEditingController();
  TextEditingController brothermarriedController = TextEditingController();
  TextEditingController motheroccuptionController = TextEditingController();
  TextEditingController motheroccpstatusController = TextEditingController();
  TextEditingController motherfamilyController = TextEditingController();
  TextEditingController familyincomeController = TextEditingController();
  RefreshController refreshController = RefreshController(initialRefresh: false);
  Rx<FamilyDetailResModel> userfamilydata = FamilyDetailResModel().obs;

  Future savefamilydetail({required refresh, var userid,var focc,
  var foccupst, var fstatus, var fvalue, var ftype, var ficome}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/family-details/store');
    final response = await http.post(url,
      body: {
      'f_user_id': userid,
        'f_father_name' : fathernameController.text,
        'f_f_paternal_gotra': fathergotraController.text,
        'f_f_occupation_details': fatheroccupController.text ==""?focc:fatheroccupController.text,
        'f_f_occupation_status': fatheroccupstatusController.text == ""?foccupst:fatheroccupstatusController.text,
        'f_mother_name': mothernameController.text,
        'f_m_paternal_gotra': motherparentController.text,
        'f_maternal_gotra': motherfamilyController.text,
        'f_family_status': familystatusController.text == ""? fstatus:familystatusController.text,
        'f_family_type': familytypeController.text == ""?ftype :familytypeController.text,
        'f_family_value': familyvalueController.text == ""? fvalue:familyvalueController.text ,
        'f_no_of_sister': sisterController.text,
        'f_no_of_sister_married': sistermarriedController.text,
        'f_no_of_brother': brotherController.text,
        'f_no_of_brother_married': brothermarriedController.text,
        'f_m_occupation_details' : motheroccuptionController.text,
        'f_m_occupation_status':motheroccpstatusController.text,
        'f_mother_gotra':mothergotraController.text,
        'f_family_income':familyincomeController.text == "" ?ficome :familyincomeController.text,
        'f_father_gotra':fathergotraController.text
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      print(response.body);
      if (data["message"] == "Record add Successfully"){
        AppSnackbar.showSnackbar("Message", data["message"], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 3));
        userfamilydata.value = FamilyDetailResModel.fromJson(data);
        fathernameController.clear();
        fathergotraController.clear();
        fatheroccupController.clear();
        fatheroccupstatusController.clear();
         mothernameController.clear();
        motherparentController.clear();
         mothergotraController.clear();
        familystatusController.clear();
         familytypeController.clear();
       familyvalueController.clear();
        sisterController.clear();
       sistermarriedController.clear();
       brotherController.clear();
       brothermarriedController.clear();
      }else {
        loading(false);
        AppSnackbar.showSnackbar("Error", data["message"], AlertType.error,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
      }
    });
    // print(data);

    update();
  }



  // to edit the user family detail
  TextEditingController editfathernameController = TextEditingController();
  TextEditingController editfathergotraController = TextEditingController();
  TextEditingController editfatheroccupController = TextEditingController();
  TextEditingController editfatheroccupstatusController = TextEditingController();
  TextEditingController editmothernameController = TextEditingController();
  TextEditingController editmotherparentController = TextEditingController();
  TextEditingController editmothergotraController = TextEditingController();
  TextEditingController editfamilystatusController = TextEditingController();
  TextEditingController editfamilytypeController = TextEditingController();
  TextEditingController editfamilyvalueController = TextEditingController();
  TextEditingController editsisterController = TextEditingController();
  TextEditingController editsistermarriedController = TextEditingController();
  TextEditingController editbrotherController = TextEditingController();
  TextEditingController editbrothermarriedController = TextEditingController();
  TextEditingController editmotheroccuptionController = TextEditingController();
  TextEditingController editmotheroccpstatusController = TextEditingController();
  TextEditingController editmotherfamilyController = TextEditingController();
  TextEditingController editfamilyincomeController = TextEditingController();
  Future editfamilydetail({required refresh, var userid,var focc,
    var foccupst, var fstatus, var fvalue, var ftype, var ficome}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/family-details/edit');
    final response = await http.patch(url,
      body: {
        'f_user_id': userid,
        'f_father_name' : editfathernameController.text,
        'f_f_paternal_gotra': editfathergotraController.text,
        'f_f_occupation_details': editfatheroccupController.text ==""?focc:editfatheroccupController.text,
        'f_f_occupation_status': editfatheroccupstatusController.text == ""?foccupst:editfatheroccupstatusController.text,
        'f_mother_name': editmothernameController.text,
        'f_m_paternal_gotra': editmotherparentController.text,
        'f_maternal_gotra': editmotherfamilyController.text,
        'f_family_status': editfamilystatusController.text == ""? fstatus:editfamilystatusController.text,
        'f_family_type': editfamilytypeController.text == ""?ftype :editfamilytypeController.text,
        'f_family_value': editfamilyvalueController.text == ""? fvalue:editfamilyvalueController.text ,
        'f_no_of_sister': editsisterController.text,
        'f_no_of_sister_married': editsistermarriedController.text,
        'f_no_of_brother': editbrotherController.text,
        'f_no_of_brother_married': editbrothermarriedController.text,
        'f_m_occupation_details' : editmotheroccuptionController.text,
        'f_m_occupation_status': editmotheroccpstatusController.text,
        'f_mother_gotra': editmothergotraController.text,
        'f_family_income': editfamilyincomeController.text == "" ?ficome : editfamilyincomeController.text,
        'f_father_gotra': editfathergotraController.text
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      print(response.body);
      if (data["message"] == "Record Update Successfully"){
        AppSnackbar.showSnackbar("Message", "Record Update Successfully", AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 3));
        userfamilydata.value = FamilyDetailResModel.fromJson(data);
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
    savefamilydetail(refresh: true);
    refreshController.refreshCompleted();
  }
}