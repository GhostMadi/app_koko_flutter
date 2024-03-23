import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/features/auth/data/repository/user_repo.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  UserRepository userRepository;
  SignInBloc({required UserRepository myUserRepo})
      : userRepository = myUserRepo,
        super(SignInInitial()) {
    on<SignInRequired>((event, emit) {
      emit(SignInProcess());
      try {
        userRepository.signIn(event.email, event.password);
        emit(SignInSuccess());
      } catch (e) {
        log(e.toString());
        emit(SignInFailure());
      }
    });
  }
}
