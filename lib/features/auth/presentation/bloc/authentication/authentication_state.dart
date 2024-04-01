part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unAuthenticated, unknown }

class AuthenticationState {
  final AuthenticationStatus? status;
  User? user;
  AuthenticationState._(
      {this.status = AuthenticationStatus.unknown, this.user});

  AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);
  AuthenticationState.unAuthenticated()
      : this._(status: AuthenticationStatus.unAuthenticated);

  AuthenticationState.unknown() : this._(status: AuthenticationStatus.unknown);
}
