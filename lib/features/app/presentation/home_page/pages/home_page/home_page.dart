import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/login/bloc/sign_in_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {
            context.read<SignInBloc>().add(const SignOutRequired());
          },
          icon: const Icon(Icons.exit_to_app),
          color: Colors.black,
        ),
      ),
    );
  }
}
