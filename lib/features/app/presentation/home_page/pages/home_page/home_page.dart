import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/text_style.dart';
import 'package:flutter_application_2/features/app/presentation/home_page/pages/individual_page/individual_page.dart';
import 'package:flutter_application_2/features/app/presentation/home_page/pages/search/search.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/get_user_data/bloc/get_user_data_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/login/bloc/sign_in_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    BlocProvider(
      create: (context) => GetUserDataBloc(
          myUserRepo: context.read<AuthenticationBloc>().userRepository),
      child: const IndividualPage(),
    ),
    const SearchPage(),
  ];
  int currenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'CoCa',
          style: customIconStyle,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [pages[currenIndex]],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currenIndex = index;
            });
          },
          currentIndex: currenIndex,
          backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                )),
            BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.white,
                ))
          ]),
    );
  }
}
