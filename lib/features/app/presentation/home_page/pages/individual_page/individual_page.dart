import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/features/app/presentation/home_page/bloc/upload_picture/bloc/upload_picture_bloc.dart';
import 'package:flutter_application_2/features/app/presentation/home_page/pages/individual_page/avatar.dart';
import 'package:flutter_application_2/features/app/presentation/home_page/pages/individual_page/edit.dart';
import 'package:flutter_application_2/features/app/presentation/home_page/pages/individual_page/images.dart';
import 'package:flutter_application_2/features/app/presentation/home_page/pages/individual_page/individ_data.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/get_user_data/bloc/get_user_data_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(height: 15),
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetUserDataBloc(
                  myUserRepo: context.read<AuthenticationBloc>().userRepository)
                ..add(GetUserData(
                    myUserId:
                        context.read<AuthenticationBloc>().state.user!.uid)),
            ),
            BlocProvider(
              create: (context) => UploadPictureBloc(
                  myUserRepository:
                      context.read<AuthenticationBloc>().userRepository),
            ),
          ],
          child: const Avatar(),
        ),
        const SizedBox(height: 20),
        BlocProvider(
          create: (context) => GetUserDataBloc(
              myUserRepo: context.read<AuthenticationBloc>().userRepository)
            ..add(GetUserData(
                myUserId: context.read<AuthenticationBloc>().state.user!.uid)),
          child: const Edit(),
        ),
        const SizedBox(height: 15),
        const Images(),
        const SizedBox(height: 15),
        BlocProvider(
          create: (context) => GetUserDataBloc(
              myUserRepo: context.read<AuthenticationBloc>().userRepository)
            ..add(GetUserData(
                myUserId: context.read<AuthenticationBloc>().state.user!.uid)),
          child: const IndividData(),
        )
      ]),
    );
  }
}
