import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_app/firebase_helper/firebase%20auth/auth_functions.dart';
import 'package:new_app/screens/auth/login_page/login_page.dart';
import 'package:new_app/widgets/form_submit_button.dart';
import 'package:new_app/widgets/form_text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

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
              "Welcome ",
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
                    hintText: "name",
                    controller: nameController,
                    validator: (value) {
                      // if (value!.isEmpty) {
                      //   return "Required";
                      // }
                      return null;
                    },
                  ),
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
                    isPassword: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      }
                      if (value.length < 6) {
                        return "Password must be of minimum 6 characters";
                      }
                      return null;
                    },
                  ),
                  FormSubmitButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          AuthFunctions.instance.signUserUp(
                            email: emailController.text,
                            password: passwordController.text,
                            context: context,
                          );
                        }
                      },
                      buttonText: "Signup")
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
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: Colors.black38,
                      )),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                        },
                      text: " Login",
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
