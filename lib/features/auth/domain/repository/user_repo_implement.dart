import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/features/auth/data/models/user.dart';
import 'package:flutter_application_2/features/auth/data/repository/user_repo.dart';
import 'package:flutter_application_2/features/auth/domain/enitites/user_entity.dart';

class FirbaseRepository implements UserRepository {
  FirbaseRepository({FirebaseAuth? firebaseAuth})
      : auth = firebaseAuth ?? FirebaseAuth.instance;

  final userCollection = FirebaseFirestore.instance.collection('Users');
  final FirebaseAuth auth;

  @override
  Stream<User?> get user {
    return auth.authStateChanges().map((event) {
      final user = event;
      return user;
    });
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: myUser.gmail, password: password);

      myUser = myUser.copyWith(userId: user.user!.uid);
      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUser user) async {
    try {
      await userCollection.doc(user.userId).set(user.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String gmail) async {
    try {
      await auth.sendPasswordResetEmail(email: gmail);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      log('failed signOut:${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<MyUser> getUserData(String userId) async {
    try {
      final MyUser user = await userCollection.doc(userId).get().then((value) =>
          MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!)));
      return user;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
