import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:demo_flu/modules/login/login_controller.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String labelSubmit;
  MyButton({
    super.key,
    required this.onTap,
    required this.labelSubmit,
  });
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(8)),
        child: Obx(() => Center(
              child: controller.isLoading.value
                  ? const SizedBox(
                      width: 30, height: 30, child: CircularProgressIndicator())
                  : Text(
                      labelSubmit,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 2.0,
                          fontWeight: FontWeight.bold),
                    ),
            )),
      ),
    );
  }
}
