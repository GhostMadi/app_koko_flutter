import 'package:flutter/material.dart';
import 'package:flutter_application_2/app_view.dart';
import 'package:flutter_application_2/features/auth/data/repository/user_repo.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationBloc>(
            create: (_) => AuthenticationBloc(myUserRepository: userRepository))
      ],
      child: const AppView(),
    );
  }
}
