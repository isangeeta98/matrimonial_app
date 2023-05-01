import 'package:get/get.dart';
import 'package:meetmeapp/helper/status_helper.dart';
import '../controller/auth_controller.dart';


class AppManager {
  static StatusHelper statusHelper = StatusHelper();
  static AuthController authController = Get.find<AuthController>();
}