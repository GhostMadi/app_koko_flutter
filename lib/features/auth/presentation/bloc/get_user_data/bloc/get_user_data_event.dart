part of 'get_user_data_bloc.dart';

abstract class GetUserDataEvent extends Equatable {
  const GetUserDataEvent();

  @override
  List<Object> get props => [];
}

class GetUserData extends GetUserDataEvent {
  final String userId;
  const GetUserData({required this.userId});

  @override
  List<Object> get props => [userId];
}
