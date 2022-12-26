import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:yeniumut/view/auth/log_in.dart';
import 'package:yeniumut/view/home_page.dart';
import 'package:yeniumut/view/splash_screen.dart';
import 'package:yeniumut/view/starting_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAEC2gHrDhWYG6m4rTsUT1wDQHfWQnTHak",
      projectId: "yeniumut-26562",
      messagingSenderId: "931020001726",
      appId: "1:931020001726:web:a5fbddf5070c924ae369ef",
    ),
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yeni Umut',
      home: SplashScreen(),
    );
  }
}
