import 'package:demo_flu/core/utils/get_storage_key.dart';
import 'package:demo_flu/routes/app_pages.dart';
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
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
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     });
    try {
      Map<String, String> data = {
        'phone': emailController.text,
        'password': passwordController.text
      };
      print(data);
      repository
          .login(data)
          .then((value) => {
                // Navigator.pop(context),
                _getStorage.write(
                    (GetStorageKey.accessToken), value.accessToken),
                _getStorage.write(
                    (GetStorageKey.refreshToken), value.refreshToken),
                Get.offAllNamed(Routes.home)
                // Navigator.pushReplacementNamed(context, '/home'),
              })
          .onError((error, stackTrace) => {});
      // {Navigator.pop(context), showErrorMessage(error.toString())});
    } catch (e) {
      // Navigator.pop(context);
      showErrorMessage(e.toString());
    }
  }
}
