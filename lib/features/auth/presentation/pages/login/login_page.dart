import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/regexp.dart';
import 'package:flutter_application_2/constants/text_style.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/login/bloc/sign_in_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/signUp/bloc/sign_up_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/pages/register/register.dart';
import 'package:flutter_application_2/features/auth/presentation/widgets/circle.dart';
import 'package:flutter_application_2/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter_application_2/features/auth/presentation/widgets/ftext_field_custome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final keyForm = GlobalKey<FormState>();
final emailController = TextEditingController();
final passwordController = TextEditingController();
bool isRequired = false;
bool errorComment = false;
bool signUpFailure = true;
bool isAccepted = true;
String error = '';

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            setState(() {
              isRequired = false;
            });
          } else if (state is SignInFailure) {
            setState(() {
              isRequired = false;
              isAccepted = false;
              error = 'incorrect password or gmail';
            });
          } else if (state is SignInProcess) {
            setState(() {
              isRequired = true;
            });
          }
        },
        child: Form(
          key: keyForm,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('KOKO', style: customIconStyle),
                    const Text('login',
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
                            isAccepted = false;
                            error = 'fill the gap';
                          });
                        } else if (!emailRegExp.hasMatch(email)) {
                          setState(() {
                            isAccepted = false;
                            error = 'wrong gmail';
                          });
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      controller: passwordController,
                      labelText: 'password',
                      obsecure: true,
                      keyBoardType: TextInputType.text,
                      validator: (password) {
                        if (password!.isEmpty) {
                          setState(() {
                            isAccepted = false;
                            error = 'fill the gap';
                          });
                          return '';
                        } else if (password.length < 5) {
                          setState(() {
                            isAccepted = false;
                            error = 'at least 6 characters';
                            passwordController.clear();
                          });
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    isAccepted
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
                                error,
                                style: const TextStyle(
                                    fontFamily: 'Bungee', color: Colors.white),
                              ),
                            )),
                    const SizedBox(height: 10),
                    !isRequired
                        ? CustomButton(
                            buttonText: 'start',
                            onTap: () {
                              context.read<SignInBloc>().add(SignInRequired(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim()));
                            })
                        : const CircleCustome(),
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      BlocProvider<SignUpBloc>(
                                        create: (context) => SignUpBloc(
                                            myUserRepo: context
                                                .read<AuthenticationBloc>()
                                                .userRepository),
                                        child: const RegisterPage(),
                                      )));
                        },
                        child: const Text(
                          'registrate',
                          style: TextStyle(
                              fontSize: 20, fontFamily: 'BungeeShade'),
                        )),
                    const Text(
                      'or',
                      style: TextStyle(fontFamily: 'BungeeShade'),
                    ),
                    const Text(
                      'reset password',
                      style: TextStyle(fontSize: 20, fontFamily: 'BungeeShade'),
                    ),
                    const SizedBox(height: 60),
                    const Text(
                      '2024',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'BungeeShade'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
