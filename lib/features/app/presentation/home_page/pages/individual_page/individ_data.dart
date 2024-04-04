import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/get_user_data/bloc/get_user_data_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndividData extends StatefulWidget {
  const IndividData({super.key});

  @override
  State<IndividData> createState() => _IndividDataState();
}

TextStyle dataStyle =
    const TextStyle(fontFamily: 'Bungee', fontSize: 30, color: Colors.white);

class _IndividDataState extends State<IndividData> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.black),
        child: BlocBuilder<GetUserDataBloc, GetUserDataState>(
          builder: (context, state) {
            if (state.status == GetUserStatus.success) {
              final map = state.myUser!;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name:${map.name}', style: dataStyle),
                    Text('Age:${map.age}', style: dataStyle),
                    Text('Gender:${map.gender}', style: dataStyle),
                    Text('School:${map.school}', style: dataStyle),
                    Text('Majore:${map.majore}', style: dataStyle),
                    Text('GPA:${map.gpa}', style: dataStyle),
                  ],
                ),
              );
            } else if (state.status == GetUserStatus.loading) {
              return SizedBox(
                height: size.height / 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Loading...', style: dataStyle),
                ),
              );
            }
            return SizedBox(
              height: size.height / 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Error...', style: dataStyle),
              ),
            );
          },
        ),
      ),
    );
  }
}
