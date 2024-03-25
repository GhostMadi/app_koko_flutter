import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/regexp.dart';
import 'package:flutter_application_2/features/auth/presentation/pages/login/login_page.dart';
import 'package:flutter_application_2/features/auth/presentation/pages/section_1/section_one.dart';
import 'package:flutter_application_2/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter_application_2/features/auth/presentation/widgets/ftext_field_custome.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
final keyForm = GlobalKey<FormState>();
bool isReuired = false;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Form(
          key: keyForm,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('CoCo', style: TextStyle(fontSize: 45)),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'email',
                    obsecure: false,
                    keyBoardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'fill the field';
                      } else if (!emailRegExp.hasMatch(value)) {
                        return "enter the correct email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'password',
                    obsecure: true,
                    keyBoardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'fill the field';
                      } else if (value.length < 6) {
                        return "at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: confirmPasswordController,
                    hintText: 'confirm password',
                    obsecure: true,
                    keyBoardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'fill the field';
                      } else if (value.length < 6) {
                        return "at least 6 characters";
                      } else if (value != passwordController.text) {
                        return 'passwords did not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  !isRequired
                      ? CustomButton(
                          buttonText: 'Sign Up',
                          onTap: () {
                            if (keyForm.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => SectionOne(
                                          gmail: emailController.text,
                                          password: passwordController.text)));
                            }
                          },
                        )
                      : const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Sign in'))
                ],
              ),
            ),
          )),
    );
  }
}
