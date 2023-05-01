import 'dart:convert';

import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:get_storage/get_storage.dart';

import '../../elements/stringconstant.dart';
import '../../helper/app_snackbar.dart';
import 'package:http/http.dart' as http;
import '../../helper/network/network_manager.dart';


class UploadImagesController extends GetxController{
  RxBool loading = false.obs;
  String postToken = GetStorage().read(Constants.token);

  Future uploaduserimages({required refresh, userimage, var userid}) async  {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/profile-image/store');
    String fileName = userimage.path.split('/').last;
    var headers = {
      'Authorization': 'Bearer $postToken'
    };
    final request = await  http.MultipartRequest('POST',
        Uri.parse('http://65.2.137.114:5000/api/front/profile-image/store'));

        request.fields.addAll({
         'profile_user_id': userid
        });
       request.files.add(await http.MultipartFile.
        fromPath('profile_multi_img', userimage.path));
        request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
           if (response.statusCode == 200){
             print(response.stream.bytesToString());
      AppSnackbar.showSnackbar("Message", "Save Successfully", AlertType.success,
          position: SnackPosition.TOP, duration: const Duration(seconds: 3));
    }else {
            loading(false);
            AppSnackbar.showSnackbar("Error", "Not Saved", AlertType.error,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
         }
       // .
    // then((response) {
    //
    // });
    // print(data);

   // update();
  }


  Future setuserprofile({required refresh, var userid}) async {
    final url = Uri.parse('http://65.2.137.114:5000/api/front/profile-image/status');
    final response =  await http.patch(url,
      body: {
      "id": userid,
        "profile_status": "1"
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": 'Bearer $postToken'
      },);
    var data = jsonDecode(response.body);
    print(response.body);
     if (data["_id"] != ""){
      AppSnackbar.showSnackbar("Message", "Set As Profile Image", AlertType.success,
          position: SnackPosition.TOP, duration: const Duration(seconds: 3));
     }
      // else {
    //   loading(false);
    //   AppSnackbar.showSnackbar("Error", data["message"], AlertType.error,
    //       position: SnackPosition.TOP, duration: const Duration(seconds: 2));
    // }
    // print(data);

    update();
  }
}