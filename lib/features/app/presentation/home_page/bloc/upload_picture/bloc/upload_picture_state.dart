part of 'upload_picture_bloc.dart';

abstract class UploadPictureState extends Equatable {
  const UploadPictureState();

  @override
  List<Object> get props => [];
}

final class UploadPictureInitial extends UploadPictureState {}

class UploadPictureFail extends UploadPictureState {}

class UploadPictureLoading extends UploadPictureState {}

// ignore: must_be_immutable
class UploadPictureSuccess extends UploadPictureState {
  final String userImage;
  UploadPictureSuccess({required this.userImage});
}
