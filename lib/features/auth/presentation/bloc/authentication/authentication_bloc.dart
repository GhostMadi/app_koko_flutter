import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/features/auth/data/repository/user_repo.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  UserRepository userRepository;
  StreamSubscription<User?>? userSubscription;
  AuthenticationBloc({required UserRepository myUserRepository})
      : userRepository = myUserRepository,
        super(const AuthenticationState.unknown()) {
    userSubscription = userRepository.user.listen((event) {
      add(AuthenticationChanges(event));
    });

    on<AuthenticationChanges>((event, emit) {
      if (event.user != null) {
        emit(AuthenticationState.authenticated(event.user!));
      } else {
        emit(const AuthenticationState.unAuthenticated());
      }
    });
  }
  @override
  Future<void> close() {
    userSubscription?.cancel();
    return super.close();
  }
}
