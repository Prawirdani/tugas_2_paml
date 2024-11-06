import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas_2_paml/config/theme/colors.dart';
import 'package:tugas_2_paml/presentation/splash/splash_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
