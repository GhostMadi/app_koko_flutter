import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/auth/presentation/pages/section_2/majore.dart';
import 'package:flutter_application_2/features/auth/presentation/pages/section_2/school.dart';

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

class _SectionTwoState extends State<SectionTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: Form(
          key: keyState,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SchoolSelect(callName: (school) {
                    schoolController = school;
                  }),
                  const SizedBox(height: 15),
                  MajoresSelect(school: schoolController)
                ],
              ),
            ),
          )),
    );
  }
}
