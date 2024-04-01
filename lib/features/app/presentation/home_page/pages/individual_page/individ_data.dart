import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/text_style.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/get_user_data/bloc/get_user_data_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/widgets/circle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndividData extends StatefulWidget {
  const IndividData({super.key});

  @override
  State<IndividData> createState() => _IndividDataState();
}

late final user;

class _IndividDataState extends State<IndividData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocBuilder<GetUserDataBloc, GetUserDataState>(
        builder: (context, state) {
          if (state is GetUserloading) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Name: ", style: customStyleText),
                  TextSpan(text: '...', style: customStyleData)
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Age: ", style: customStyleText),
                  TextSpan(text: '...', style: customStyleData)
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Gender: ", style: customStyleText),
                  TextSpan(text: '...', style: customStyleData)
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "School: ", style: customStyleText),
                  TextSpan(text: '...', style: customStyleData)
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Majore: ", style: customStyleText),
                  TextSpan(text: '...', style: customStyleData)
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "GPA: ", style: customStyleText),
                  TextSpan(text: '...', style: customStyleData)
                ])),
              ],
            );
          } else if (state is GetUserSuccess) {
            final map = state.myUser;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Name:", style: customStyleText),
                  TextSpan(text: map.name.toUpperCase(), style: customStyleData)
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Age:", style: customStyleText),
                  TextSpan(text: map.age.toUpperCase(), style: customStyleData)
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Gender:", style: customStyleText),
                  TextSpan(
                      text: map.gender.toUpperCase(), style: customStyleData)
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "School:", style: customStyleText),
                  TextSpan(
                      text: map.school.toUpperCase(), style: customStyleData)
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Majore:", style: customStyleText),
                  TextSpan(
                      text: map.majore.toUpperCase(), style: customStyleData)
                ])),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "GPA:", style: customStyleText),
                  TextSpan(text: map.gpa.toUpperCase(), style: customStyleData)
                ])),
              ],
            );
          } else {
            return Column(
              children: [
                Text('Name', style: customStyleText),
                Text('Name', style: customStyleText),
                Text('Name', style: customStyleText),
                Text('Name', style: customStyleText),
              ],
            );
          }
        },
      ),
    );
  }
}
