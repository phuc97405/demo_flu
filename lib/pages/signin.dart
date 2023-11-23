import 'package:demo_flu/components/my_button.dart';
import 'package:demo_flu/components/my_textfield.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final usernameController = TextEditingController();
  final passwordTextController = TextEditingController();

  createAccount() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Dialog(
            backgroundColor: Colors.transparent,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [CircularProgressIndicator()]),
          );
        });
    try {
      //call api create
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('the currenr user is not authorized'),
              actions: [ElevatedButton(onPressed: () {}, child: Text('ok'))],
            );
          });
    }
  }

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset('lib/images/ic_bus.png'),
            const SizedBox(
              height: 50,
            ),
            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: passwordTextController,
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
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            MyButton(
              onTap: () {},
            ),
            const SizedBox(height: 50),

            Row(
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
    );
  }
}
