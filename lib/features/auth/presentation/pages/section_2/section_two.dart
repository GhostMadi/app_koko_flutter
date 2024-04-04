import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/auth/data/models/user.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/signUp/bloc/sign_up_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/pages/section_2/gpa.dart';
import 'package:flutter_application_2/features/auth/presentation/pages/section_2/majore.dart';
import 'package:flutter_application_2/features/auth/presentation/pages/section_2/school.dart';
import 'package:flutter_application_2/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionTwo extends StatefulWidget {
  final String gmail;
  final String password;
  final String name;
  final String age;
  final String gender;

  const SectionTwo(
      {required this.age,
      required this.gmail,
      required this.password,
      required this.name,
      required this.gender,
      super.key});

  @override
  State<SectionTwo> createState() => _SectionTwoState();
}

final keyState = GlobalKey<FormState>();
String schoolController = '';
String majoreController = '';
String gpaController = '';

class _SectionTwoState extends State<SectionTwo> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          return;
        } else if (state is SignUpSuccess) {
        } else {
          return;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SchoolSelect(callName: (school) {
                  setState(() {
                    schoolController = school;
                  });
                }),
                const SizedBox(height: 15),
                MajoresSelect(
                    callName: (majore) {
                      setState(() {
                        majoreController = majore;
                      });
                    },
                    school:
                        schoolController.isEmpty ? "ISE" : schoolController),
                const SizedBox(height: 15),
                GpaWidget(callName: (gpa) {
                  gpaController = gpa.toString();
                }),
                const SizedBox(height: 20),
                CustomButton(
                    buttonText: 'press',
                    onTap: () {
                      if (schoolController.isNotEmpty &&
                          gpaController.isNotEmpty &&
                          majoreController.isNotEmpty) {
                        try {
                          MyUser myUser = MyUser.empty;
                          myUser = myUser.copyWith(
                            gmail: widget.gmail,
                            name: widget.name,
                            age: widget.age,
                            gender: widget.gender,
                            school: schoolController,
                            majore: majoreController,
                            gpa: gpaController,
                          );
                          setState(() {
                            context
                                .read<SignUpBloc>()
                                .add(SignUpUser(myUser, widget.password));
                          });
                        } on FirebaseException catch (e) {
                          log(e.toString());
                        }
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
