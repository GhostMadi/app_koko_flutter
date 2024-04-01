import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/features/auth/data/repository/user_repo.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late StreamSubscription<User?> userSubscription;
  AuthenticationBloc({required UserRepository myUserRepository})
      : userRepository = myUserRepository,
        super(AuthenticationState.unknown()) {
    userSubscription = userRepository.user.listen((authUser) {
      add(AuthenticationChanges(authUser));
    });

    on<AuthenticationChanges>((AuthenticationChanges event, emit) {
      if (event.user != null) {
        emit(AuthenticationState.authenticated(event.user!));
      } else {
        emit(AuthenticationState.unAuthenticated());
      }
    });
  }
  @override
  Future<void> close() {
    userSubscription.cancel();
    return super.close();
  }
}
