part of 'get_user_data_bloc.dart';

enum GetUserStatus { success, loading, failure }

class GetUserDataState {
  GetUserStatus status;
  MyUser? myUser;
  GetUserDataState._({this.myUser, this.status = GetUserStatus.failure});

  GetUserDataState.success(MyUser user)
      : this._(status: GetUserStatus.success, myUser: user);
  GetUserDataState.failur() : this._(status: GetUserStatus.failure);
  GetUserDataState.loading() : this._(status: GetUserStatus.loading);
}
