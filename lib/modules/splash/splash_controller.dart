import 'package:demo_flu/core/utils/get_storage_key.dart';
import 'package:demo_flu/routes/app_pages.dart';
import 'package:demo_flu/services/data/repository/repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  Repository _repository;
  SplashController(this._repository);
  final getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (getStorage.read(GetStorageKey.accessToken) != null) {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAllNamed(Routes.home);
      });
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}
