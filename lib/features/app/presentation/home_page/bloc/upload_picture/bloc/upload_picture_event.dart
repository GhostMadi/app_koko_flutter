part of 'upload_picture_bloc.dart';

abstract class UploadPictureEvent {
  const UploadPictureEvent();
}

class UploadPicture extends UploadPictureEvent {
  final String file;
  final String userId;
  UploadPicture(this.file, this.userId);
}
