import 'dart:convert';

import 'package:get/get.dart';

import '../models/drop_down_response_model/annual_income_response_model.dart';
import '../models/drop_down_response_model/body_type_response_model.dart';
import '../models/drop_down_response_model/caste_response_model.dart';
import '../models/drop_down_response_model/diet_response_model.dart';
import '../models/drop_down_response_model/drink_response_model.dart';
import '../models/drop_down_response_model/height_response_model.dart';
import '../models/drop_down_response_model/occupation_field_response_model.dart';
import '../models/drop_down_response_model/specially_able_response_model.dart';
import '../models/drop_down_response_model/tenative_time_response_model.dart';
import '../models/drop_down_response_model/education_response_model.dart';
import '../models/drop_down_response_model/family_income_response_model.dart';
import '../models/drop_down_response_model/family_status_response_model.dart';
import '../models/drop_down_response_model/family_type_response_model.dart';
import '../models/drop_down_response_model/family_value_response_model.dart';
import '../models/drop_down_response_model/occupation_response_model.dart';
import '../models/drop_down_response_model/religion_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/drop_down_response_model/residental_status_response_model.dart';
import '../models/drop_down_response_model/smoke_response_model.dart';

class ReligionController extends GetxController{
  Rx<ReligionResponseModel> religionData = ReligionResponseModel().obs;
  Rx<DrinkResponseModel> drinkData = DrinkResponseModel().obs;
  Rx<BodyTypeResponseModel> bodytypeData = BodyTypeResponseModel().obs;
  Rx<ResidentalStatusResponseModel> residentalstatusData = ResidentalStatusResponseModel().obs;
  Rx<EducationResponseModel> educationData = EducationResponseModel().obs;
  Rx<OccupationResponseModel> occupationData = OccupationResponseModel().obs;
  Rx<DietResponseModel> dietData = DietResponseModel().obs;
  Rx<SmokeResponseModel> smokedata = SmokeResponseModel().obs;
  Rx<FamilyValueResponseModel> familyvaluedata = FamilyValueResponseModel().obs;
  Rx<FamilyTypeResponseModel> familytypedata = FamilyTypeResponseModel().obs;
  Rx<FamilyStatusResponseModel> familystatusdata = FamilyStatusResponseModel().obs;
  Rx<FamilyIncomeResponseModel> familyincomedata = FamilyIncomeResponseModel().obs;
  Rx<TenativeTimeResModel> tenativetimedata = TenativeTimeResModel().obs;
  Rx<OccupationFieldResponseModel> occupationfirlddata = OccupationFieldResponseModel().obs;
  Rx<AnnualIncomeResponseModel> annualincomedata = AnnualIncomeResponseModel().obs;
  Rx<HeightResponseModel> heightdata = HeightResponseModel().obs;
  Rx<SpeciallyAbleResponseModel> speciallyalbedata = SpeciallyAbleResponseModel().obs;
  Rx<CasteResponseModel> castedata = CasteResponseModel().obs;
  RxBool loading = false.obs;

  @override

  void onInit() {
    super.onInit();
    getreligiondata(refresh: true);
    getdrinkdata(refresh: true);
    getbodytypedata(refresh: true);
    geteducationdata(refresh: true);
    getoccupationdata(refresh: true);
    getdietdata(refresh: true);
    getsmokedata(refresh: true);
    getfamilyvaluedata(refresh: true);
    getfamilytypedata(refresh: true);
    getfamilystatusdata(refresh: true);
    getfamilyincomedata(refresh: true);
    gettenativetimedata(refresh: true);
    getoccupationfielddata(refresh: true);
    getannualincomedata(refresh: true);
    getheightdata(refresh: true);
    getspeciallyabledata(refresh: true);
  }

  // slider api
  void getreligiondata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-religion');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      religionData.value = ReligionResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }


  void getdrinkdata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-drink');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      drinkData.value = DrinkResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }


  void getbodytypedata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-body-type');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      bodytypeData.value = BodyTypeResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }


  void getresidentalstatusdata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-residencial-status');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      residentalstatusData.value = ResidentalStatusResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }


  void geteducationdata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-eduction-sector');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      educationData.value = EducationResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }


  Future getoccupationdata({required refresh}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-occupations-status');
    final response = await http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },);
    var data = jsonDecode(response.body);
    //print(data);
    print(response.body);
    occupationData.value = OccupationResponseModel.fromJson(data);
    //     .
    // then((response) {
    //
    // });
    // print(data);

    update();
  }

  void getdietdata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-diet');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      dietData.value = DietResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }


  void getsmokedata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-smoke');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      smokedata.value = SmokeResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }

  void getfamilyvaluedata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-family-value');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      familyvaluedata.value = FamilyValueResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }


  void getfamilytypedata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-family-type');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      familytypedata.value = FamilyTypeResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }


  void getfamilystatusdata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-family-status');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      familystatusdata.value = FamilyStatusResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }


  void getfamilyincomedata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-family-income');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      familyincomedata.value = FamilyIncomeResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }


  void gettenativetimedata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-tentative-time');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      tenativetimedata.value = TenativeTimeResModel.fromJson(data);
    });
    // print(data);

    update();
  }


  void getoccupationfielddata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-occupations-field');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      occupationfirlddata.value = OccupationFieldResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }


  void getannualincomedata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-annual-income');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var annualdata = jsonDecode(response.body);
      //print(data);
      print(response.body);
      annualincomedata.value = AnnualIncomeResponseModel.fromJson(annualdata);
    });
    // print(data);

    update();
  }


  void getheightdata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-family-height');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var highdata = jsonDecode(response.body);
      //print(data);
      print(response.body);
      heightdata.value = HeightResponseModel.fromJson(highdata);
    });
    // print(data);

    update();
  }


  void getspeciallyabledata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-specialisation-ability');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var abledata = jsonDecode(response.body);
      //print(data);
      print(response.body);
      speciallyalbedata.value = SpeciallyAbleResponseModel.fromJson(abledata);
    });
    // print(data);

    update();
  }


  Future getcastedata({required refresh, var religioid}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-caste?religionId=')
        .replace(queryParameters: {'religionId': religioid,});
    final response =  await http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        //"Authorization": 'Bearer $postToken'
      },);
    var data = jsonDecode(response.body);
    print(response.body);
    castedata.value = CasteResponseModel.fromJson(data);
    update();
  }



}