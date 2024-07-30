import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_app/constants/routes.dart';
import 'package:new_app/constants/snackbar.dart';
import 'package:new_app/screens/home_page/home_page.dart';

class AuthFunctions {
  static AuthFunctions instance = AuthFunctions();
  final _auth = FirebaseAuth.instance;

  void signUserIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (context.mounted) {
        Routes.instance.pushAndRemoveUntil(HomePage(), context);
      }
    } catch (e) {
      if (context.mounted) {
        showSnackbar(e.toString(), context);
      }
    }
  }

  void signUserUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final a = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (context.mounted) {
        Routes.instance.pushAndRemoveUntil(HomePage(), context);
      }
    } catch (e) {
      if (context.mounted) {
        showSnackbar(e.toString(), context);
      }
    }
  }
}
