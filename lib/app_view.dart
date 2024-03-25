import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/login/bloc/sign_in_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/pages/login/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
        background: Colors.white,
        surface: Colors.black,
        error: Colors.red,
        onPrimary: Colors.black,
        onSecondary: Colors.white,
      )),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          return BlocProvider(
              create: (context) => SignInBloc(
                  myUserRepo:
                      (context).read<AuthenticationBloc>().userRepository));
        } else {
          return BlocProvider(
            create: (context) => SignInBloc(
                myUserRepo: context.read<AuthenticationBloc>().userRepository),
            child: const LoginPage(),
          );
        }
      }),
    );
  }
}
