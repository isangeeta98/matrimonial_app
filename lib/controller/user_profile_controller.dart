import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../elements/stringconstant.dart';
import '../helper/network/endpoints.dart';
import '../helper/network/network_manager.dart';
import '../models/user_profile_response_model.dart';
import 'package:http/http.dart' as http;

class UserProfileController extends GetxController{
  RxBool loading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  Rx<UserProfileResponseModel> userprofiledata = UserProfileResponseModel().obs;
  String postToken = GetStorage().read(Constants.token);
  @override

  void onInit() async{
    super.onInit();
    await getuserprofiledata(refresh: true);
  }

  // slider api
  Future getuserprofiledata({required refresh})  async{
    final url = Uri.parse('http://65.2.137.114:5000/api/front/user-comman-api/get-my-profile');
    final response =  await http.get(url,
      headers: {
        //"Content-Type": "application/x-www-form-urlencoded",
        "Authorization" : "Bearer $postToken"
      },);
    NetworkManager.instance.getDio().options.headers["Authorization"] = "Bearer $postToken";
    //var response = await NetworkManager.instance.getDio().get(Endpoints.userprofile);
    var data = jsonDecode(response.body);
    print("data");
    print(data);
    userprofiledata.value = UserProfileResponseModel.fromJson(data);
    // print(data);

    update();
  }

  void onRefresh() async {
    getuserprofiledata(refresh: true);
    refreshController.refreshCompleted();
  }
}