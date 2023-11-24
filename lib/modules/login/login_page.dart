import 'package:demo_flu/components/my_button.dart';
import 'package:demo_flu/components/my_textfield.dart';
import 'package:demo_flu/components/square_tile.dart';
import 'package:demo_flu/core/utils/get_storage_key.dart';
import 'package:demo_flu/services/data/provider/my_api_provider.dart';
import 'package:demo_flu/services/data/repository/repository.dart';
import 'package:demo_flu/services/navigation/authen_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final emailController = TextEditingController(text: '08422222222');
  final passwordController = TextEditingController(text: '11111111');
  final repository = Repository(MyApiProvide());
  final _getStorage = GetStorage();

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
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
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.purple,
            title: Text(
              msg,
              style: const TextStyle(color: Colors.white),
            ),
          );
        });
  }

  void loginNormal() {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      Map<String, String> data = {
        'phone': emailController.text,
        'password': passwordController.text
      };
      repository
          .login(data)
          .then((value) => {
                Navigator.pop(context),
                _getStorage.write(
                    (GetStorageKey.accessToken), value.accessToken),
                _getStorage.write(
                    (GetStorageKey.refreshToken), value.refreshToken),
                Navigator.pushReplacementNamed(context, '/home'),
              })
          .onError((error, stackTrace) =>
              {Navigator.pop(context), showErrorMessage(error.toString())});
    } catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset('lib/images/ic_bus.png'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Welcome back you've been missed!",
                style: TextStyle(color: Colors.black26),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.black26),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              MyButton(labelSubmit: 'Sign In', onTap: loginNormal
                  // signUserIn,
                  ),
              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(color: Colors.grey[700], fontSize: 12),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                      imgPath: 'lib/images/gg.png',
                      onTap: () => AuthService().signInWithGoogle()),
                  const SizedBox(width: 30),
                  SquareTile(
                    imgPath: 'lib/images/apple.png',
                    onTap: () {},
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
              // ElevatedButton.icon(
              //   label: const Text(
              //     "Sign In",
              //     style: TextStyle(color: Colors.black),
              //   ),
              //   onPressed: () {
              //     createAccount();
              //   },
              //   icon: const Icon(
              //     Icons.login,
              //     color: Colors.green,
              //   ),
              // ),
              // TextButton(
              //     onPressed: () {
              //       showDialog(
              //           context: context,
              //           builder: (context) {
              //             return AlertDialog(
              //               title: const Text('Error'),
              //               content:
              //                   const Text('the currenr user is not authorized'),
              //               actions: [
              //                 ElevatedButton(
              //                     onPressed: () {
              //                       Navigator.pop(context);
              //                     },
              //                     child: const Text('ok'))
              //               ],
              //             );
              //           });
              //     },
              //     child: const Text(
              //       'Create Account',
              //       style: TextStyle(color: Colors.black),
              //     ))
            ]),
          ),
        ),
      ),
    );
  }
}
