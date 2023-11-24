import 'package:demo_flu/modules/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute(builder: (_) => const AuthPage()));
      Navigator.of(context).pushReplacementNamed('/authen');
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.pink],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'lib/images/ic_bus.png',
          ),
          const Text(
            "Bus App",
            style: TextStyle(
                color: Colors.green, fontSize: 20, fontWeight: FontWeight.w500),
          )
        ]),
      ),
    );
  }
}
