import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../elements/stringconstant.dart';
import '../../models/all_type_users_model/view_contact_list_response_model.dart';

class GetViewContactUserListController extends GetxController{
  RxBool loading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  String postToken = GetStorage().read(Constants.token);
  Rx<ViewContactListResModel> viewcontactlistdata = ViewContactListResModel().obs;

  void getviewcontactlistdata({required refresh})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/view-contact-profile/get-all');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer $postToken"
      },).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      viewcontactlistdata.value = ViewContactListResModel.fromJson(data);
    });
    // print(data);

    update();
  }
}