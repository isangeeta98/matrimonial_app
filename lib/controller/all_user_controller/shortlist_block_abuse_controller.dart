import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../helper/app_snackbar.dart';
import 'package:http/http.dart' as http;

class ShortListController extends GetxController{
  RxBool loading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  TextEditingController commentController = TextEditingController();

  // for save shortlist data
  void saveshortlistdata({required refresh, var sl_userId, var sl_shortlist_userId})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/shortlist-profile/store');
    final response =  http.post(url,
      body: {
        'sl_userId': sl_userId,
        'sl_shortlist_userId': sl_shortlist_userId,
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((response) {
      var data = jsonDecode(response.body);
      print(response.body);
      if (data["message"] == "Record add Successfully"){
        AppSnackbar.showSnackbar("Message", data["message"], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 3));
      }else {
        loading(false);
        AppSnackbar.showSnackbar("Error", data["message"], AlertType.error,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
      }
    });
    // print(data);

    update();
  }

  // for save block user
  void saveblockuserdata({required refresh, var bp_userId, var bp_block_userId})  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/block-profile/store');
    final blockresponse =  http.post(url,
      body: {
        'bp_userId': bp_userId,
        'bp_block_userId': bp_block_userId,
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    then((blockresponse) {
      var blockdata = jsonDecode(blockresponse.body);
      print(blockresponse.body);
      if (blockdata["message"] == "Record add Successfully"){
        AppSnackbar.showSnackbar("Message", blockdata["message"], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 3));
      }else {
        loading(false);
        AppSnackbar.showSnackbar("Error", blockdata["message"], AlertType.error,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
      }
    });
    // print(data);

    update();
  }


  //report about the user
  Future submitabsuiveuser({required refresh, var ap_userId, var ap_abuse_userId})  async{
    final url = Uri.parse('http://65.2.137.114:5000/api/front/abuse-profile/store');
    final abuseresponse =  await http.post(url,
      body: {
        'ap_userId': ap_userId,
        'ap_abuse_userId': ap_abuse_userId,
        'ap_comment': commentController.text,
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },);
    var abusedata = jsonDecode(abuseresponse.body);
    print(abuseresponse.body);
    if (abusedata["message"] == "Record add Successfully"){
      AppSnackbar.showSnackbar("Message", abusedata["message"], AlertType.success,
          position: SnackPosition.TOP, duration: const Duration(seconds: 3));
      commentController.clear();
    }else {
      loading(false);
      AppSnackbar.showSnackbar("Error", abusedata["message"], AlertType.error,
          position: SnackPosition.TOP, duration: const Duration(seconds: 2));
    }
    // print(data);

    update();
  }

  void onRefresh() async {
    saveshortlistdata(refresh: true);
    saveblockuserdata(refresh: true);
    refreshController.refreshCompleted();
  }
}