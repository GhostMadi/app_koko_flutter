import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/features/auth/data/models/user.dart';

abstract class UserRepository {
  Stream<User?> get user;
  Future<void> signIn(String email, String password);
  Future<MyUser> signUp(MyUser myUser, String password);
  Future<void> signOut();
  Future<void> resetPassword(String gmail);
  Future<void> setUserData(MyUser user);
  Future<MyUser> getUserData(String userId);
}
