import 'package:demo_flu/modules/home/home_binding.dart';
import 'package:demo_flu/modules/home/home_view.dart';
import 'package:demo_flu/modules/login/login_binding.dart';
import 'package:demo_flu/modules/login/login_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.login;
  static const home = Routes.home;
  static final routes = [
    GetPage(
        name: _Paths.login,
        page: () => LoginView(
              onTap: () {},
            ),
        binding: LoginBinding()),
    GetPage(name: _Paths.home, page: () => HomeView(), binding: HomeBinding()),
    // GetPage(name: _Paths.home)
  ];
}
