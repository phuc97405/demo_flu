import 'package:demo_flu/modules/signup/singup_controller.dart';
import 'package:demo_flu/services/data/provider/my_api_provider.dart';
import 'package:demo_flu/services/data/repository/repository.dart';
import 'package:get/get.dart';

class SingUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController(Repository(MyApiProvide())));
  }
}
