import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/features/auth/data/models/user.dart';
import 'package:flutter_application_2/features/auth/data/repository/user_repo.dart';

part 'get_user_data_event.dart';
part 'get_user_data_state.dart';

class GetUserDataBloc extends Bloc<GetUserDataEvent, GetUserDataState> {
  UserRepository userRepository;
  GetUserDataBloc({required UserRepository myUserRepo})
      : userRepository = myUserRepo,
        super(const GetUserDataState.loading()) {
    on<GetUserData>((event, emit) async {
      try {
        final user = await userRepository.getUserData(event.userId);
        emit(GetUserDataState.success(user));
      } catch (e) {
        log(e.toString());
        emit(const GetUserDataState.failure());
      }
    });
  }
}
