import 'package:demo_flu/modules/home/home_binding.dart';
import 'package:demo_flu/modules/home/home_view.dart';
import 'package:demo_flu/modules/login/login_binding.dart';
import 'package:demo_flu/modules/login/login_view.dart';
import 'package:demo_flu/modules/signup/sign_up_view.dart';
import 'package:demo_flu/modules/signup/signup_binding.dart';
import 'package:demo_flu/modules/splash/splash_binding.dart';
import 'package:demo_flu/modules/splash/splash_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.splash;
  static const home = Routes.home;
  static const login = Routes.login;
  static const signUp = Routes.signUp;

  static final routes = [
    GetPage(
        name: _Paths.splash,
        page: () => const SplashView(),
        binding: SplashBinding()),

    GetPage(
        name: _Paths.login,
        page: () => const LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: _Paths.signUp,
        page: () => const SignUpView(),
        binding: SignUpBinding()),
    GetPage(name: _Paths.home, page: () => HomeView(), binding: HomeBinding()),
    // GetPage(name: _Paths.home)
  ];
}
