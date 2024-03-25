import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/auth/presentation/pages/section_1/gender_widget.dart';
import 'package:flutter_application_2/features/auth/presentation/pages/section_2/section_two.dart';
import 'package:flutter_application_2/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter_application_2/features/auth/presentation/widgets/ftext_field_custome.dart';

class SectionOne extends StatefulWidget {
  final String gmail;
  final String password;

  const SectionOne({required this.gmail, required this.password, super.key});

  @override
  State<SectionOne> createState() => _SectionOneState();
}

final keyState = GlobalKey<FormState>();
final nameController = TextEditingController();
final ageController = TextEditingController();
String genderController = '';

class _SectionOneState extends State<SectionOne> {
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Form(
          key: keyState,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: nameController,
                    hintText: 'name',
                    obsecure: false,
                    keyBoardType: TextInputType.name,
                    validator: (name) {
                      if (name!.isEmpty) {
                        return "fill the field";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: ageController,
                    hintText: 'age',
                    obsecure: false,
                    keyBoardType: TextInputType.number,
                    validator: (age) {
                      if (age!.isEmpty) {
                        return "fill the field";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  GenderSelect(
                    callName: (gender) {
                      setState(() {
                        genderController = gender;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                      buttonText: "next",
                      onTap: () {
                        if (keyState.currentState!.validate() == true) {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => SectionTwo(
                                      age: ageController.text,
                                      gmail: widget.gmail,
                                      password: widget.password,
                                      name: nameController.text,
                                      gender: genderController)));
                        }
                      })
                ],
              ),
            ),
          )),
    );
  }
}
