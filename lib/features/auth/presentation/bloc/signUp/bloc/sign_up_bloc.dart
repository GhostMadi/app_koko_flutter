import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/features/auth/data/models/user.dart';
import 'package:flutter_application_2/features/auth/data/repository/user_repo.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;
  SignUpBloc({required UserRepository myUserRepo})
      : userRepository = myUserRepo,
        super(SignUpInitial()) {
    on<SignUpUser>((event, emit) async {
      emit(SignUpProcess());
      try {
        MyUser user = await userRepository.signUp(event.user!, event.password!);
        await userRepository.setUserData(user);
        emit(SignUpSuccess());
      } catch (e) {
        log(e.toString());
        emit(SignUpFailure());
      }
    });
  }
}
