// ignore_for_file: avoid_renaming_method_parameters, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/data/firestore.dart';

abstract class AuthenticationDatasource {
  Future<void> register(String email, String password, String passwordConfirm);
  Future<void> login(String email, String password);
}

class AuthenticationRemote extends AuthenticationDatasource {
  @override
  Future<void> login(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(), password: password.trim());
  }

  @override
  Future<void> register(String email, String password, String passwordConfirm) async {
    if (passwordConfirm == password) {
      await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim())
        .then((value) {
          FirestoreDatasource().createUser(email);
        });
    }
  }
}