import 'package:cozy_app/pages/error_page.dart';
import 'package:cozy_app/pages/splash_page.dart';
import 'package:cozy_app/providers/space_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        home: const SplashPage(),
        routes: {
          '/error_page':(context) => const ErrorPage(),
        },
      ),
    );
  }
}
