import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_app/constants/theme_data.dart';
import 'package:new_app/firebase_options.dart';
import 'package:new_app/screens/auth/auth_gate.dart';
import 'package:new_app/screens/products_per_category/products_per_category.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: AuthGate(),
    );
  }
}
