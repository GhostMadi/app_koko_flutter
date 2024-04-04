import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/get_user_data/bloc/get_user_data_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: size.height / 13,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'to edit',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Bungee'),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Container(
                height: size.height / 13,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: BlocBuilder<GetUserDataBloc, GetUserDataState>(
                    builder: (context, state) {
                      if (state.status == GetUserStatus.success) {
                        final map = state.myUser!;
                        return Text(
                          map.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'Bungee'),
                        );
                      }
                      return const Text(
                        'loading',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'Bungee'),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
