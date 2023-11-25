import 'dart:convert';

import 'package:demo_flu/core/utils/get_storage_key.dart';
import 'package:demo_flu/routes/app_pages.dart';
import 'package:demo_flu/services/data/model/req_login_model.dart';
import 'package:demo_flu/services/data/repository/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  Repository repository;
  LoginController(this.repository);
  final emailController = TextEditingController(text: '08422222222');
  final passwordController = TextEditingController(text: '11111111');
  // final repository = Repository(MyApiProvide());
  final _getStorage = GetStorage();
  var useId = ''.obs;
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
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
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

  void showErrorMessage(String msg) {
    Get.defaultDialog(
        title: "Notice",
        middleText: msg,
        backgroundColor: Colors.red,
        titleStyle: const TextStyle(color: Colors.white),
        middleTextStyle: const TextStyle(color: Colors.white),
        radius: 30);
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
  }

  void loginNormal() {
    isLoading.value = true;
    try {
      final params = ReqLoginModel(phone: '08422222222', password: '11111111');
      repository
          .login(params)
          .then((value) => {
                print(jsonEncode(value)),
                // _getStorage.write(
                //     (GetStorageKey.accessToken), value.token.accessToken),
                // _getStorage.write(
                //     (GetStorageKey.refreshToken), value.token.refreshToken),
                isLoading.value = false,
                Get.offAllNamed(Routes.home)
              })
          .onError((error, stackTrace) => {
                print(jsonEncode(error)),
                showErrorMessage(error.toString()),
                isLoading.value = false,
              });
    } catch (e) {
      isLoading.value = false;
      showErrorMessage(e.toString());
    }
  }
}
