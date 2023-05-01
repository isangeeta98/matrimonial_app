import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../elements/stringconstant.dart';
import '../models/get_all_user_response_model.dart';

class GetAllUserController extends GetxController{
  RxBool loading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  Rx<GetAllUserResponseModel> alluserdata = GetAllUserResponseModel().obs;
  String postToken = GetStorage().read(Constants.token);
  @override

  void onInit() {
    super.onInit();
    getalluserdata(refresh: true);
  }

  // slider api
  Future getalluserdata({required refresh}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-all-user');
    final response = await http.get(url,
      headers: {
        "Authorization": 'Bearer $postToken'
      },).
    //var response =  NetworkManager.instance.getDio().post(Endpoints.register, data: input).
    then((response) {
      var data = jsonDecode(response.body);
      print(response.body);
      alluserdata.value = GetAllUserResponseModel.fromJson(data);
    });
    // print(data);

    update();
  }

  void onRefresh() async {
    getalluserdata(refresh: true);
    refreshController.refreshCompleted();
  }
}