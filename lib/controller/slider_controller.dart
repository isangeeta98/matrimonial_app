import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

import '../models/slider_response_model.dart';

class SliderController extends GetxController{
  RxBool loading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  Rx<SliderResponseModel> sliderdata = SliderResponseModel().obs;
  RxList<SliderData> filterdata = <SliderData>[].obs;
  @override
  
  void onInit() {
    super.onInit();
    getsliderimages(refresh: true);
  }

  // slider api
  void getsliderimages({required refresh})  {
    //final url = Uri.parse('http://localhost:5000/api/admin-panel/slider/index?show=10&search=blog 1');
    final url = Uri.parse('http://65.2.137.114:5000/api/admin-panel/slider/index?show=10&search=blog 1');
    final response =  http.get(url,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },).
    //var response =  NetworkManager.instance.getDio().post(Endpoints.register, data: input).
    then((response) {
      var data = jsonDecode(response.body);
      //print(data);
      print(response.body);
      sliderdata.value = SliderResponseModel.fromJson(data);
      filterdata.value = sliderdata.value.data!;
    });
    // print(data);

    update();
  }

  void onRefresh() async {
    getsliderimages(refresh: true);
    refreshController.refreshCompleted();
  }
}