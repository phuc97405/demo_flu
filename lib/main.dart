import 'package:demo_flu/pages/auth_page.dart';
import 'package:demo_flu/pages/home_page.dart';
import 'package:demo_flu/pages/splash_screen.dart';
import 'package:demo_flu/station.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

enum ColorE { red, green, blue }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const SplashScreen(),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => const SplashScreen(),
        // '/authen': (context) => const AuthPage(),
        // '/home': (context) => const HomePage(),
        // '/station': (context) => const Station(),
        // },
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Color(0xffCADEAF),
              onPrimary: Color(0xff628941),
              secondary: Colors.blue,
              onSecondary: Colors.blue,
              error: Colors.red,
              onError: Colors.red,
              background: Colors.white,
              onBackground: Colors.white,
              onSecondaryContainer: Colors.black,
              surface: Color.fromARGB(255, 39, 18, 18),
              onSurface: Color(0xff628941)),
          textTheme: TextTheme(
            displayLarge: const TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
            ),
            labelLarge: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xff090A0B)),
            labelMedium: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff090A0B)),
            titleMedium: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 2,
                color: Colors.black),
            headlineMedium: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 2,
                color: Color(0xffA3A5AE)),
            titleLarge: GoogleFonts.oswald(
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
            bodyMedium: GoogleFonts.merriweather(),
            displaySmall: GoogleFonts.pacifico(),
          ),
        ));
  }
}
