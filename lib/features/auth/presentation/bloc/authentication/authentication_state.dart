part of 'authentication_bloc.dart';

enum AuthStatus { authenticated, unAuthenticated, unknown }

class AuthenticationState extends Equatable {
  final AuthStatus status;
  final User? user;
  const AuthenticationState._({this.status = AuthStatus.unknown, this.user});

  const AuthenticationState.unknown() : this._();
  const AuthenticationState.unAuthenticated()
      : this._(status: AuthStatus.unAuthenticated);
  const AuthenticationState.authenticated(User user)
      : this._(status: AuthStatus.authenticated, user: user);

  @override
  List<Object> get props => [];
}
