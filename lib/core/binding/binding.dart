import 'package:app_votacao/core/controller/main_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController(), permanent: true);
   
  }
}
