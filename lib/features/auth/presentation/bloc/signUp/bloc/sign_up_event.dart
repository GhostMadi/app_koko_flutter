part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpUser extends SignUpEvent {
  final MyUser? user;
  final String? password;
  const SignUpUser(this.user, this.password);
}
