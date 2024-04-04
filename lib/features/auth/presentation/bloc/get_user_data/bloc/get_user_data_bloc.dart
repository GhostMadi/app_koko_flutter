import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/features/auth/data/models/user.dart';
import 'package:flutter_application_2/features/auth/data/repository/user_repo.dart';

part 'get_user_data_event.dart';
part 'get_user_data_state.dart';

class GetUserDataBloc extends Bloc<GetUserDataEvent, GetUserDataState> {
  UserRepository userRepository;
  GetUserDataBloc({required UserRepository myUserRepo})
      : userRepository = myUserRepo,
        super(GetUserDataState.loading()) {
    on<GetUserData>((event, emit) async {
      try {
        final user = await userRepository.getUserData(event.myUserId);

        emit(GetUserDataState.success(user));
      } catch (e) {
        emit(GetUserDataState.failur());
        log(e.toString());
      }
    });
  }
}
