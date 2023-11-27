import 'package:demo_flu/routes/app_pages.dart';
import 'package:demo_flu/services/data/repository/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  Repository repository;
  SignUpController(this.repository);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    Get.defaultDialog(
        backgroundColor: Colors.white,
        content: const CircularProgressIndicator());

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        showErrorMessage("Password don't match!");
      }
      Get.back();
    } on FirebaseAuthException catch (e) {
      Get.back();
      showErrorMessage(e.code);
      // print('No user found for that email');
    }
  }

  void showErrorMessage(String msg) {
    Get.defaultDialog(
        title: 'Notice',
        backgroundColor: Colors.purple,
        middleText: msg,
        radius: 30,
        middleTextStyle: const TextStyle(color: Colors.white),
        titleStyle: const TextStyle(
          color: Colors.white,
        ));
  }

  goToSignIn() {
    Get.offNamed(Routes.login);
  }
}
