import 'package:demo_flu/components/my_button.dart';
import 'package:demo_flu/components/my_textfield.dart';
import 'package:demo_flu/components/square_tile.dart';
import 'package:demo_flu/services/navigation/authen_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        showErrorMessage("Password don't match!");
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
      // print('No user found for that email');
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
                "Let's create an account for you!",
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
              const SizedBox(height: 10),
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 20),
              MyButton(
                labelSubmit: "Sign Up",
                onTap: signUserUp,
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
                    onTap: () => AuthService().signInWithGoogle(),
                  ),
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
                    "Already have an account?",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login now',
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