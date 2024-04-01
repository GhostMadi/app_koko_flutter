import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/app/presentation/home_page/pages/home_page/home_page.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/get_user_data/bloc/get_user_data_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/login/bloc/sign_in_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/signUp/bloc/sign_up_bloc.dart';
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
        background: Colors.grey,
        surface: Colors.black,
        error: Colors.red,
        onPrimary: Colors.black,
        onSecondary: Colors.white,
      )),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<SignInBloc>(
                create: (context) => SignInBloc(
                    myUserRepo:
                        (context).read<AuthenticationBloc>().userRepository),
              ),
              BlocProvider(
                  create: (contex) => GetUserDataBloc(
                      myUserRepo:
                          context.read<AuthenticationBloc>().userRepository)),
            ],
            child: const HomePage(),
          );
        } else {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SignInBloc(
                    myUserRepo:
                        context.read<AuthenticationBloc>().userRepository),
              ),
              BlocProvider(
                create: (context) => SignUpBloc(
                    myUserRepo:
                        context.read<AuthenticationBloc>().userRepository),
              ),
            ],
            child: const LoginPage(),
          );
        }
      }),
    );
  }
}
