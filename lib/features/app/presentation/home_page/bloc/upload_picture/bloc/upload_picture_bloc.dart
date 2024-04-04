import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/features/auth/data/repository/user_repo.dart';

part 'upload_picture_event.dart';
part 'upload_picture_state.dart';

class UploadPictureBloc extends Bloc<UploadPictureEvent, UploadPictureState> {
  UserRepository userRepository;
  UploadPictureBloc({required UserRepository myUserRepository})
      : userRepository = myUserRepository,
        super(UploadPictureInitial()) {
    on<UploadPicture>((event, emit) async {
      emit(UploadPictureLoading());
      try {
        String userImage =
            await userRepository.uploadPicture(event.file, event.userId);
        emit(UploadPictureSuccess(userImage: userImage));
      } catch (e) {
        log(e.toString());
        emit(UploadPictureFail());
      }
    });
  }
}
