import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../elements/stringconstant.dart';
import '../models/new_match_response_model.dart';
import 'package:http/http.dart' as http;

class NewMatchController extends GetxController{
  RxBool loading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  Rx<NewMatchResponseModel> newmatchdata = NewMatchResponseModel().obs;
  String postToken = GetStorage().read(Constants.token);
  @override

  void onInit() {
    super.onInit();
    getnewmatchdata(refresh: true);
  }

  // slider api
  void getnewmatchdata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/new-match-api');
    final response =  http.get(url,
      headers: {
        "Authorization": 'Bearer $postToken'
      },).
    //var response =  NetworkManager.instance.getDio().post(Endpoints.register, data: input).
    then((response) {
      var data = jsonDecode(response.body);
      print(response.body);
      newmatchdata.value = NewMatchResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }

  void onRefresh() async {
    getnewmatchdata(refresh: true);
    refreshController.refreshCompleted();
  }
}