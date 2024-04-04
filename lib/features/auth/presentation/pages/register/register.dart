import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/regexp.dart';
import 'package:flutter_application_2/constants/text_style.dart';
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
final keyFormReg = GlobalKey<FormState>();
bool isRequired = false;
bool isAcceptedReg = false;
String errorReg = '';

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('KOKO', style: customIconStyle),
                const Text('sign up',
                    style: TextStyle(fontFamily: 'BungeeShade')),
                const SizedBox(height: 15),
                CustomTextField(
                    controller: emailController,
                    labelText: 'email',
                    obsecure: false,
                    keyBoardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email!.isEmpty) {
                        setState(() {
                          isAcceptedReg = true;
                          errorReg = 'fill the gap';
                        });
                      }
                      if (!emailRegExp.hasMatch(email)) {
                        setState(() {
                          isAcceptedReg = true;
                          errorReg = 'gmail is not correct';
                        });
                      }
                      return null;
                    }),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: passwordController,
                  labelText: 'password',
                  obsecure: true,
                  keyBoardType: TextInputType.text,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: confirmPasswordController,
                  labelText: 'confirm password',
                  obsecure: true,
                  keyBoardType: TextInputType.text,
                ),
                const SizedBox(height: 15),
                !isAcceptedReg
                    ? const SizedBox()
                    : Container(
                        height: MediaQuery.of(context).size.height / 11.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffFF666A),
                        ),
                        child: Center(
                          child: Text(
                            errorReg,
                            style: const TextStyle(
                                fontFamily: 'Bungee', color: Colors.white),
                          ),
                        )),
                const SizedBox(height: 20),
                CustomButton(
                  buttonText: 'go',
                  onTap: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      setState(() {
                        isAcceptedReg = true;
                        errorReg = 'fill the gaps';
                      });
                    } else if (emailRegExp
                            .hasMatch(emailController.text.trim()) &&
                        passwordController.text.length >= 6 &&
                        passwordController.text ==
                            confirmPasswordController.text) {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SectionOne(
                                  gmail: emailController.text,
                                  password: passwordController.text)));
                    } else if (passwordController.text.length <= 5) {
                      setState(() {
                        isAcceptedReg = true;
                        errorReg = 'password must at least 6 character';
                      });
                    } else {
                      setState(() {
                        isAcceptedReg = true;
                        errorReg = 'incorrect password or gmail';
                      });
                    }
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text('login',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'BungeeShade')))
              ],
            ),
          ),
        ));
  }
}
