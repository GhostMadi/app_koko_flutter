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
              signUpFailure = false;
              passwordController.clear();
              isRequired = false;
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('CoCo', style: customIconStyle),
                    CustomTextField(
                      controller: emailController,
                      labelText: 'email',
                      obsecure: false,
                      keyBoardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty &&
                            !emailRegExp.hasMatch(value) &&
                            errorComment) {
                          return 'error';
                        } else if (!signUpFailure) {
                          return 'error';
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'error';
                        } else if (value.length < 6) {
                          return "at least 6 characters";
                        } else if (!signUpFailure) {
                          return 'error';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    !isRequired
                        ? CustomButton(
                            buttonText: 'sign In',
                            onTap: () {
                              if (keyForm.currentState!.validate()) {
                                try {
                                  context.read<SignInBloc>().add(
                                        SignInRequired(
                                            email: emailController.text.trim(),
                                            password:
                                                passwordController.text.trim()),
                                      );
                                } catch (e) {
                                  errorComment = true;
                                }
                              }
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
                          'Sign up?',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'RoboStyle'),
                        )),
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
