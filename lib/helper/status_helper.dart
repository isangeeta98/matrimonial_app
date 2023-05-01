import 'package:get_storage/get_storage.dart';
import '../elements/stringconstant.dart';

class StatusHelper {
  void setLoginStatus(bool status) {
    GetStorage().write(Constants.loginStatus, status);
  }

  bool get getLoginStatus {
    if (GetStorage().read(Constants.loginStatus) == null) {
      return false;
    } else {
      return GetStorage().read(Constants.loginStatus);
    }
  }
}
