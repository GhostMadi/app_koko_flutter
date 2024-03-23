import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/features/auth/data/repository/user_repo.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  UserRepository userRepository;
  SignUpBloc({required UserRepository myUserRepo})
      : userRepository = myUserRepo,
        super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) {
      emit(SignUpProcess());
      try {
        userRepository.signIn(event.email, event.password);
        emit(SignUpSuccess());
      } catch (e) {
        log(e.toString());
        emit(SignUpFailure());
      }
    });
  }
}
