part of 'get_user_data_bloc.dart';

abstract class GetUserDataEvent {
  const GetUserDataEvent();
}

class GetUserData extends GetUserDataEvent {
  final String myUserId;
  const GetUserData({required this.myUserId});
}
