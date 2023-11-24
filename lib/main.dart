import 'package:demo_flu/core/utils/get_storage_key.dart';
import 'package:demo_flu/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'services/firebase/firebase_options.dart';

void main() async {
  await GetStorage.init();
  final _getStorage = GetStorage();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(
    title: 'Bus App',
    initialRoute: _getStorage.read(GetStorageKey.accessToken) == null
        ? AppPages.initial
        : AppPages.home,
    getPages: AppPages.routes,
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
        )),
    debugShowCheckedModeBanner: false,
  ));
}
