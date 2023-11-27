import 'package:demo_flu/modules/station/station_controller.dart';
import 'package:demo_flu/services/data/provider/api_provider.dart';
import 'package:demo_flu/services/data/repository/repository.dart';
import 'package:get/get.dart';

class StationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StationController>(StationController(Repository(MyApiProvide())));
  }
}