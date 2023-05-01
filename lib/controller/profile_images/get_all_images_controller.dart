import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../elements/stringconstant.dart';
import 'package:http/http.dart' as http;

import '../../models/get_all_images_res_model.dart';

class GetAllImagesController extends GetxController{
  RxBool loading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  Rx<GetImagesResponseModel> getallimages = GetImagesResponseModel().obs;
  String postToken = GetStorage().read(Constants.token);
  @override

  void onInit() async{
    super.onInit();
    await getallimagesdata(refresh: true);
  }

  // slider api
  Future getallimagesdata({required refresh})  async{
    final url = Uri.parse('http://65.2.137.114:5000/api/front/profile-image/index');
    final response =  await http.get(url,
      headers: {
        //"Content-Type": "application/x-www-form-urlencoded",
        "Authorization" : "Bearer $postToken"
      },);
   // NetworkManager.instance.getDio().options.headers["Authorization"] = "Bearer $postToken";
    //var response = await NetworkManager.instance.getDio().get(Endpoints.userprofile);
    var data = jsonDecode(response.body);
    print(data);
    getallimages.value = GetImagesResponseModel.fromJson(data);

    update();
  }

  void onRefresh() async {
    getallimagesdata(refresh: true);
    refreshController.refreshCompleted();
  }
}