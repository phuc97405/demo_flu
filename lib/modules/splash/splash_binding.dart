import 'package:demo_flu/modules/login/login_controller.dart';
import 'package:demo_flu/modules/splash/splash_controller.dart';
import 'package:demo_flu/services/data/provider/my_api_provider.dart';
import 'package:demo_flu/services/data/repository/repository.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController((Repository(MyApiProvide()))));
  }
}
