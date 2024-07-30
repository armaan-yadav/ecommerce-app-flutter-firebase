import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_app/constants/routes.dart';
import 'package:new_app/firebase_helper/firebase%20auth/auth_functions.dart';
import 'package:new_app/screens/auth/signup_page/signup_page.dart';
import 'package:new_app/screens/home_page/home_page.dart';
import 'package:new_app/widgets/form_submit_button.dart';
import 'package:new_app/widgets/form_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        // color: Colors.red,
        child: Column(
          children: [
            const Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                letterSpacing: 3,
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  AuthTextField(
                    controller: emailController,
                    hintText: "email",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      }
                      if (value.contains("@") == false) {
                        return "Email must contain @ symbol";
                      }
                      return null;
                    },
                  ),
                  AuthTextField(
                    controller: passwordController,
                    hintText: "password",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      }
                      if (value.length < 6) {
                        return "Password must be of minimum 6 characters";
                      }
                      return null;
                    },
                    isPassword: true,
                  ),
                  FormSubmitButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          try {
                            print("calling");
                            final a = FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);
                            print(a);
                            AuthFunctions.instance.signUserIn(
                                email: emailController.text,
                                password: passwordController.text,
                                context: context);
                          } catch (e) {
                            print(e.toString());
                          }
                        }
                      },
                      buttonText: "Login"),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                ),
                children: [
                  const TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black38,
                      )),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ));
                        },
                      text: " SignUp",
                      style: const TextStyle(
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
