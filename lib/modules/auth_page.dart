import 'package:demo_flu/modules/login_or_register.dart';
import 'package:demo_flu/modules/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          return const HomePage();
        } else {
          return const LoginOrRegister();
        }
      },
    ));
  }
}
