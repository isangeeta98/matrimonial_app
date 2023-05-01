import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

import '../../elements/stringconstant.dart';
import '../../helper/app_snackbar.dart';
import '../../models/save_personal_data_models/edit_peronal_data_res_model.dart';
import '../../models/get_user_detail_res_model.dart';

class SavePersonalDetailController extends GetxController{
  RxBool loading = false.obs;
  TextEditingController useridController = TextEditingController();
  TextEditingController profileforController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController middlenameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController religionsController = TextEditingController();
  TextEditingController casteController = TextEditingController();
  TextEditingController maritialstatusController = TextEditingController();
  TextEditingController noofchildController = TextEditingController();
  TextEditingController childlivewithController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController residencialController = TextEditingController();
  TextEditingController immigratecountryController = TextEditingController();
  TextEditingController livingwithfamilyController = TextEditingController();
  TextEditingController dietController = TextEditingController();
  TextEditingController drinkController = TextEditingController();
  TextEditingController smokeController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController speciallyableController = TextEditingController();
  TextEditingController abledesController = TextEditingController();
  TextEditingController tentativetimeController = TextEditingController();
  TextEditingController annualincomeController = TextEditingController();
  TextEditingController tobController = TextEditingController();
  TextEditingController bodytypeController = TextEditingController();
  TextEditingController birthplaceController = TextEditingController();
  Rx<EditPersonalDataResponseModel> editpersonnaldata = EditPersonalDataResponseModel().obs;
  String postToken = GetStorage().read(Constants.token);
  RxString doneClicked = "".obs;
  RxString familyClicked = "".obs;
  RxString addressClicked = "".obs;
  RxString educationClicked = "".obs;
  RxString partnerClicked = "".obs;
  RxString profiledatastore = "".obs;
  RxString familydatastore = "".obs;
  RxString addressdatastore = "".obs;
  RxString educationdatastore = "".obs;
  RxString partnerdatastore = "".obs;
  RxString marriagedatastore = "".obs;

  Future savepersonaldetail({required refresh, var userid, var rel,var profilefor,
    var resident, var diet, var somke, var drink, var annualin, var bodytype}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/personal-details/store');
    final response =  await http.post(url,
      body: {
        'p_user_id': userid,
        'p_profile_create_for' : profilefor,
        'p_name': nameController.text,
        'p_religion': religionController.text,
        'p_caste': casteController.text,
        'p_maritial_status': maritialstatusController.text,
        'p_no_of_child': noofchildController.text,
        'p_no_of_child_living_with_you': childlivewithController.text,
        'gender': genderController.text,
        'p_dob': dobController.text,
        'p_residencial_status': residencialController.text == "" ? rel: residencialController.text,
        'p_immigrate_diffrent_country': immigratecountryController.text,
        'p_living_with_family': livingwithfamilyController.text,
        'p_diet': dietController.text == "" ?diet:dietController.text,
        'p_drink': drinkController.text == "" ?drink:drinkController.text ,
        'p_smoke': smokeController.text == "" ?somke :smokeController.text,
        'p_height': heightController.text,
        'p_specially_ability': speciallyableController.text,
        'p_specially_ability_description': abledesController.text,
        'p_tentative_time': tentativetimeController.text,
        'p_annulIncome': annualincomeController.text == "" ? annualin:annualincomeController.text,
        'p_tob': tobController.text,
        'p_bodyType': bodytypeController.text == "" ? bodytype :bodytypeController.text,
        'p_pob': birthplaceController.text
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": 'Bearer $postToken'
      },);
    var data = jsonDecode(response.body);
    print(response.body);
    if (data["message"] == "Record add Successfully"){
      editpersonnaldata.value = EditPersonalDataResponseModel.fromJson(data);
      AppSnackbar.showSnackbar("Message", data["message"], AlertType.success,
          position: SnackPosition.TOP, duration: const Duration(seconds: 3));
    } else if (data["message"] == "Personal Details Already Exist"){
      editpersonnaldata.value = EditPersonalDataResponseModel.fromJson(data);
    }else {
      loading(false);
      AppSnackbar.showSnackbar("Error", data["message"], AlertType.error,
          position: SnackPosition.TOP, duration: const Duration(seconds: 2));
    }
    // print(data);

    update();
  }



  // for edit the personal user data
  TextEditingController editprofileforController = TextEditingController();
  TextEditingController editnameController = TextEditingController();
  TextEditingController editmiddlenameController = TextEditingController();
  TextEditingController editlastnameController = TextEditingController();
  TextEditingController editreligionController = TextEditingController();
  TextEditingController editreligionsController = TextEditingController();
  TextEditingController editcasteController = TextEditingController();
  TextEditingController editmaritialstatusController = TextEditingController();
  TextEditingController editnoofchildController = TextEditingController();
  TextEditingController editchildlivewithController = TextEditingController();
  TextEditingController editgenderController = TextEditingController();
  TextEditingController editdobController = TextEditingController();
  TextEditingController editresidencialController = TextEditingController();
  TextEditingController editimmigratecountryController = TextEditingController();
  TextEditingController editlivingwithfamilyController = TextEditingController();
  TextEditingController editdietController = TextEditingController();
  TextEditingController editdrinkController = TextEditingController();
  TextEditingController editsmokeController = TextEditingController();
  TextEditingController editheightController = TextEditingController();
  TextEditingController editspeciallyableController = TextEditingController();
  TextEditingController editabledesController = TextEditingController();
  TextEditingController edittentativetimeController = TextEditingController();
  TextEditingController editannualincomeController = TextEditingController();
  TextEditingController edittobController = TextEditingController();
  TextEditingController editbodytypeController = TextEditingController();
  TextEditingController editbirthplaceController = TextEditingController();
  Future editpersonaldetail({required refresh, var userid, var rel,
    var resident, var diet, var somke, var drink, var annualin, var bodytype, var profilefor}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/personal-details/edit');
    final response =  await http.patch(url,
      body: {
        'p_user_id': userid,
        'p_profile_create_for' : profilefor,
        'p_name': editnameController.text,
        'p_religion': editreligionController.text,
        'p_caste': editcasteController.text,
        'p_maritial_status': editmaritialstatusController.text,
        'p_no_of_child': editnoofchildController.text,
        'p_no_of_child_living_with_you': editchildlivewithController.text,
        'gender': editgenderController.text,
        'p_dob': editdobController.text,
        'p_residencial_status': editresidencialController.text == "" ? rel: editresidencialController.text,
        'p_immigrate_diffrent_country': editimmigratecountryController.text,
        'p_living_with_family': editlivingwithfamilyController.text,
        'p_diet': editdietController.text == "" ?diet:editdietController.text,
        'p_drink': editdrinkController.text == "" ?drink:editdrinkController.text ,
        'p_smoke': editsmokeController.text == "" ?somke :editsmokeController.text,
        'p_height': editheightController.text,
        'p_specially_ability': editspeciallyableController.text,
        'p_specially_ability_description': editabledesController.text,
        'p_tentative_time': edittentativetimeController.text,
        'p_annulIncome': editannualincomeController.text == "" ? annualin:editannualincomeController.text,
        'p_tob': edittobController.text,
        'p_bodyType': editbodytypeController.text == "" ? bodytype :editbodytypeController.text,
        'p_pob': editbirthplaceController.text
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": 'Bearer $postToken'
      },);
    var data = jsonDecode(response.body);
    print(response.body);
    if (data["message"] == "Record Update Successfully"){
      editpersonnaldata.value = EditPersonalDataResponseModel.fromJson(data);
      AppSnackbar.showSnackbar("Message", data["message"], AlertType.success,
          position: SnackPosition.TOP, duration: const Duration(seconds: 3));
      profileforController.clear();
    }else {
      loading(false);
      AppSnackbar.showSnackbar("Error", data["message"], AlertType.error,
          position: SnackPosition.TOP, duration: const Duration(seconds: 2));
    }
    // print(data);

    update();
  }

// get user detail data
  Rx<GetUserDetailResModel> userdetaildata = GetUserDetailResModel().obs;
  Future getuserdetaildata({required refresh, var userid}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-user-by-id?userid=')
        .replace(queryParameters: {'userid': userid,});
    final response =  await http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": 'Bearer $postToken'
      },);
    var data = jsonDecode(response.body);
    print(response.body);
    userdetaildata.value = GetUserDetailResModel.fromJson(data);

    // print(data);

    update();
  }


}


