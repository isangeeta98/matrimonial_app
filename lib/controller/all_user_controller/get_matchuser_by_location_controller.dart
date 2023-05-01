import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

import '../../elements/stringconstant.dart';
import '../../models/all_type_users_model/get_mtch_by_location_res_model.dart';

class GetMatchByLocationController extends GetxController {
  RxBool loading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  Rx<GetLocationMatchResponseModel> getlocationmatchdata = GetLocationMatchResponseModel().obs;
  String postToken = GetStorage().read(Constants.token);

  @override

  void onInit() {
    super.onInit();
    getmatchlocationdata(refresh: true);
  }

  // slider api
  void getmatchlocationdata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/new-match-by-location');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization" : "Bearer $postToken"
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      getlocationmatchdata.value = GetLocationMatchResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }

  void onRefresh() async {
    getmatchlocationdata(refresh: true);
    refreshController.refreshCompleted();
  }
}