import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../elements/stringconstant.dart';
import 'package:http/http.dart' as http;

import '../../helper/app_snackbar.dart';
import '../../models/get_profile_image_res_model.dart';

class GetProfileImageController extends GetxController{
  RxBool loading = false.obs;
  String postToken = GetStorage().read(Constants.token);
  Rx<GetProfileImageResponseModel> getimageprofile = GetProfileImageResponseModel().obs;

  void onInit() {
    super.onInit();
    getuserprofileimage(refresh: true);
  }

  Future getuserprofileimage({required refresh}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/profile-image/get-profile-image');
    final response =  await http.get(url,
      // body: {
      //   "id": userid,
      //   "profile_status": "1"
      // },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": 'Bearer $postToken'
      },);
    var data = jsonDecode(response.body);
    print(response.body);
    getimageprofile.value = GetProfileImageResponseModel.fromJson(data);

    update();
  }
}