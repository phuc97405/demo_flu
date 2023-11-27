import 'package:demo_flu/core/utils/get_storage_key.dart';
import 'package:demo_flu/services/data/model/req_login_model.dart';
import 'package:demo_flu/services/data/repository/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:demo_flu/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Repository repository;
  LoginController(this.repository);
  final phoneController = TextEditingController(text: "08411111111");
  final passwordController = TextEditingController(text: "11111111");
  final _getStorage = GetStorage();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // repository.login()
  }

  @override
  void onClose() {
    super.onClose();
  }

  void signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: phoneController.text, password: passwordController.text);
      // Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Navigator.pop(context);
      if (e.code == 'user-not-found') {
        showErrorMessage('Email is wrong.');
        // print('No user found for that email');
      } else if (e.code == 'wrong-password') {
        showErrorMessage('Password is wrong.');
        // print('Wrong password provided for that user');
      }
    }
  }

  showErrorMessage(String msg) => Get.defaultDialog(
      title: "Notice",
      middleText: msg,
      backgroundColor: Colors.red,
      titleStyle: const TextStyle(color: Colors.white),
      middleTextStyle: const TextStyle(color: Colors.white),
      radius: 10);
  // showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.purple,
  //         title: Text(
  //           msg,
  //           style: const TextStyle(color: Colors.white),
  //         ),
  //       );
  //     });

  void loginNormal() async {
    isLoading.value = true;
    try {
      final params = ReqLoginModel(
          phone: phoneController.text, password: passwordController.text);
      final res = await repository.login(params);
      print('loginNormal$res');
      // .then((value) => {
      //       _getStorage.write(
      //           (GetStorageKey.accessToken), value.data.token.accessToken),
      //       _getStorage.write((GetStorageKey.refreshToken),
      //           value.data.token.refreshToken),
      // isLoading.value = false,
      // Get.offAllNamed(Routes.home);
      // })
      // .onError((error, stackTrace) => {
      //       // (error.toString()),
      //       showErrorMessage(error.toString()),
      //       isLoading.value = false,
      //     });
    } catch (e) {
      print(e);
      isLoading.value = false;
      showErrorMessage(e.toString());
    }
  }

  goToSignUp() {
    Get.offAllNamed(Routes.signUp);
  }
}
