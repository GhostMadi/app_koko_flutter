import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/signUp/bloc/sign_up_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/pages/section_1/gender_widget.dart';
import 'package:flutter_application_2/features/auth/presentation/pages/section_2/section_two.dart';
import 'package:flutter_application_2/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter_application_2/features/auth/presentation/widgets/ftext_field_custome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
bool isAccepted = false;
String error = '';
final keyForm = GlobalKey<FormState>();

class _SectionOneState extends State<SectionOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: nameController,
                  labelText: 'name',
                  obsecure: false,
                  keyBoardType: TextInputType.name,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: ageController,
                  labelText: 'age',
                  obsecure: false,
                  keyBoardType: TextInputType.number,
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
                !isAccepted
                    ? const SizedBox()
                    : Container(
                        height: MediaQuery.of(context).size.height / 11.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffFF666A),
                        ),
                        child: Center(
                          child: Text(
                            error,
                            style: const TextStyle(
                                fontFamily: 'Bungee', color: Colors.white),
                          ),
                        )),
                const SizedBox(height: 20),
                CustomButton(
                    buttonText: "next",
                    onTap: () {
                      if (nameController.text.isNotEmpty &&
                          ageController.text.isNotEmpty &&
                          genderController.isNotEmpty) {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) {
                          return BlocProvider(
                            create: (context) => SignUpBloc(
                                myUserRepo: context
                                    .read<AuthenticationBloc>()
                                    .userRepository),
                            child: SectionTwo(
                                age: ageController.text,
                                gmail: widget.gmail,
                                password: widget.password,
                                name: nameController.text,
                                gender: genderController),
                          );
                        }));
                      } else {
                        setState(() {
                          isAccepted = true;
                          error = 'fill the gaps';
                        });
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
