part of 'get_user_data_bloc.dart';

class GetUserDataState {}

// ignore: must_be_immutable
class GetUserSuccess extends GetUserDataState {
  MyUser myUser;
  GetUserSuccess({required this.myUser});
}

class GetUserloading extends GetUserDataState {}

class GetUserFailure extends GetUserDataState {}
