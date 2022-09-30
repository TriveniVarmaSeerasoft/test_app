// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:test_app/LandingPage.dart';
 import 'packages/flutter/src/widgets/framework.dart';
//  packages/flutter/src/widgets/framework.dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
      home:LandingPage());
  }
}