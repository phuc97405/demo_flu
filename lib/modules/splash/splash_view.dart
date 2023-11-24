import 'package:demo_flu/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.pink],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'lib/images/ic_bus.png',
          ),
          const Text(
            "Bus App",
            style: TextStyle(
                color: Colors.green, fontSize: 20, fontWeight: FontWeight.w500),
          )
        ]),
      ),
    );
  }
}
