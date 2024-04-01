import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/app/presentation/home_page/pages/individual_page/individ_data.dart';
import 'package:flutter_application_2/features/app/presentation/home_page/pages/individual_page/picture.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/get_user_data/bloc/get_user_data_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation animation;
  AnimationStatus animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        animationStatus = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onDoubleTap: () {
        if (animationStatus == AnimationStatus.dismissed) {
          animationController.forward();
        } else {
          animationController.reverse();
        }
      },
      child: SizedBox(
        height: size.height / 1.5,
        width: size.width / 1.4,
        child: Center(
            child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(2, 1, 0.0015)
            ..rotateY(pi * animation.value),
          child: Container(
              height: size.height / 1.5,
              width: size.width / 1.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: animation.value >= 0.5
                  ? const Picture()
                  : BlocProvider(
                      create: (context) => GetUserDataBloc(
                          myUserRepo:
                              context.read<AuthenticationBloc>().userRepository)
                        ..add(GetUserData(
                            myUserId: context
                                .read<AuthenticationBloc>()
                                .state
                                .user!
                                .uid)),
                      child: const IndividData(),
                    )),
        )),
      ),
    );
  }
}
