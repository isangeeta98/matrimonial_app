import 'dart:convert';

import 'package:get/get.dart';

import '../../helper/app_snackbar.dart';
import 'package:http/http.dart' as http;

import '../../helper/network/network_manager.dart';
import 'package:dio/dio.dart'as dio;

class UserKycController extends GetxController{
  RxBool loading = false.obs;

  void saveuserkycdetail({required refresh, afrontimage, abackimage, panimage, var userid}) async  {
    //final url = Uri.parse('http://65.2.137.114:5000/api/front/user-kyc/store');
    String? fileName =  afrontimage.path.split('/').last;
    String? adharfrontname = abackimage.path.split('/').last;
    String? panname = panimage.path.split('/').last;
    var input = dio.FormData.fromMap({
      "kyc_user_id" : userid,
      "kyc_adhar_front": fileName,
      //dio.MultipartFile.fromFile(afrontimage.path, filename: fileName),
      "kyc_adhar_back":   adharfrontname,
      //dio.MultipartFile.fromFile(abackimage.path, filename: adharfrontname),
      "kyc_pan_card": panname
      //dio.MultipartFile.fromFile(panimage.path, filename: panname),
    });
    NetworkManager.instance.getDio().options.headers["Content-Type"] = "application/x-www-form-urlencoded";
    var response =  await NetworkManager.instance.getDio().post('http://65.2.137.114:5000/api/front/user-kyc/store',
        data: {
          "kyc_user_id" : userid,
          "kyc_adhar_front":  fileName,
         // afrontimage != null ?  dio.MultipartFile.fromFile(afrontimage.path, filename: fileName): null,
          "kyc_adhar_back":   adharfrontname,
         // abackimage != null ?  dio.MultipartFile.fromFile(abackimage.path, filename: adharfrontname) : null,
          "kyc_pan_card": panname,
          //panimage != null ?  dio.MultipartFile.fromFile(panimage.path, filename: panname): null,
        }).
    // final response =  http.post(url,
    //   body: {
    //     'p_user_id': "f_user_id",
    //
    //   },
    //   headers: {
    //     "Content-Type": "application/x-www-form-urlencoded",
    //   },).
    then((response) {
      var data = response.data;
      print(response.data);
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
}