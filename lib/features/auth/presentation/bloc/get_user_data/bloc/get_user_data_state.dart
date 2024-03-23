part of 'get_user_data_bloc.dart';

enum UserState { loading, failure, success }

class GetUserDataState extends Equatable {
  final MyUser? user;
  final UserState state;
  const GetUserDataState._({this.state = UserState.loading, this.user});

  const GetUserDataState.loading() : this._(state: UserState.loading);

  const GetUserDataState.success(MyUser user)
      : this._(state: UserState.success, user: user);

  const GetUserDataState.failure() : this._(state: UserState.failure);

  @override
  List<Object?> get props => [user];
}
