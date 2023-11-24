import 'package:demo_flu/core/utils/get_storage_key.dart';
import 'package:demo_flu/modules/login_or_register.dart';
import 'package:demo_flu/modules/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _getStorage = GetStorage();
    // return Scaffold(
    //     body:
    if (_getStorage.read(GetStorageKey.accessToken) == null) {
      return const LoginOrRegister();
    } else {
      return const HomePage(); //     StreamBuilder<User?>(
    }
    //   stream: _getStorage.read(GetStorageKey.accessToken),
    //   // FirebaseAuth.instance.authStateChanges(),
    //   builder: (BuildContext context, snapshot) {
    //     if (snapshot.hasData) {
    //       print(snapshot.data);
    //       return const HomePage();
    //     } else {
    //       return const LoginOrRegister();
    //     }
    //   },
    // )

    // );
  }
}
