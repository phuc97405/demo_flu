import 'package:demo_flu/modules/home/home_controller.dart';
import 'package:demo_flu/services/data/provider/api_provider.dart';
import 'package:demo_flu/services/data/repository/repository.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController((Repository(MyApiProvide()))));
  }
}
