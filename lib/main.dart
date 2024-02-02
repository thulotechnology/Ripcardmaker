import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rip_card_maker/splashScreen.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Rip Card Maker",
      home: SplashScreen(),
    );
  }
}
