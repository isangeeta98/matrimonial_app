import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../helper/network/network_manager.dart';
import '../../models/all_type_users_model/abuse_user_response_model.dart';
import '../../models/all_type_users_model/block_user_response_model.dart';
import '../../models/all_type_users_model/short_list_user_res_model.dart';
import 'package:http/http.dart' as http;

class ShortListUserController extends GetxController{
  RxBool loading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  Rx<ShortListUserResponseModel> shortlistuserdata = ShortListUserResponseModel().obs;
  Rx<BlockUserResponseModel> blockuserlistdata = BlockUserResponseModel().obs;
  Rx<AbuseUserResponseModel> abuseuserlistdata = AbuseUserResponseModel().obs;

  @override
  void onInit() async{
    super.onInit();
    await getshortlistdata(refresh: true);
    await getblockuserlistdata(refresh: true);
    await getabuseuserlistdata(refresh: true);
  }

  // slider api
  Future getshortlistdata({required refresh})  async{
    final url = Uri.parse('http://65.2.137.114:5000/api/front/shortlist-profile/get-all');
    final response =  await http.get(url,
      headers: {
        //"Content-Type": "application/x-www-form-urlencoded",
       // "Authorization" : "Bearer $postToken"
      },);
    //var response = await NetworkManager.instance.getDio().get(Endpoints.userprofile);
    var data = jsonDecode(response.body);
    print(data);
    shortlistuserdata.value = ShortListUserResponseModel.fromJson(data);
    // print(data);

    update();
  }



  // get block user data
  Future getblockuserlistdata({required refresh})  async{
    final url = Uri.parse('http://65.2.137.114:5000/api/front/block-profile/get-all');
    final response =  await http.get(url,
      headers: {
        //"Content-Type": "application/x-www-form-urlencoded",
        // "Authorization" : "Bearer $postToken"
      },);
    //var response = await NetworkManager.instance.getDio().get(Endpoints.userprofile);
    var blockdata = jsonDecode(response.body);
    print(blockdata);
    blockuserlistdata.value = BlockUserResponseModel.fromJson(blockdata);
    // print(data);

    update();
  }



  //abuse user data list
  Future getabuseuserlistdata({required refresh})  async{
    final url = Uri.parse('http://65.2.137.114:5000/api/front/abuse-profile/get-all');
    final response =  await http.get(url,
      headers: {
        //"Content-Type": "application/x-www-form-urlencoded",
        // "Authorization" : "Bearer $postToken"
      },);
    //var response = await NetworkManager.instance.getDio().get(Endpoints.userprofile);
    var abusedata = jsonDecode(response.body);
    print(abusedata);
    abuseuserlistdata.value = AbuseUserResponseModel.fromJson(abusedata);
    // print(data);

    update();
  }


  void onRefresh() async {
    getshortlistdata(refresh: true);
    getblockuserlistdata(refresh: true);
    getabuseuserlistdata(refresh: true);
    refreshController.refreshCompleted();
  }
}