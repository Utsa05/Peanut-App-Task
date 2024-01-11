import 'package:get/get.dart';
import 'package:peanut_app_task/controllers/home-controller.dart';
import 'package:peanut_app_task/controllers/initial-controller.dart';
import 'package:peanut_app_task/controllers/login-controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InitialController());
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.put(HomeController());
  }
}
