import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

import '../../elements/stringconstant.dart';
import '../../models/all_type_users_model/visitors_list_data_response_model.dart';

class GetVisitorsDataController extends GetxController{
  RxBool loading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  String postToken = GetStorage().read(Constants.token);
  Rx<GetVisitorListResModel> visitorslistdata = GetVisitorListResModel().obs;



  void getvisitorlistdata({required refresh, var myid})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-visitors?myId=')
        .replace(queryParameters: {'myId': myid,});
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer $postToken"
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      visitorslistdata.value = GetVisitorListResModel.fromJson(data);
    });
    // print(data);

    update();
  }
}