import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gibibooks/util/exeption.dart';

class Authentication {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> Signup({
    required String email,
    required String password,
    required String passwordConfirm,
    required String username,
    required String Bio,
    required File profile,
  }) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          Bio.isNotEmpty) {
        if (password == passwordConfirm) {
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
        } else {
          throw exceptions('password and confirm password should be the same!');
        }
      } else {
        throw exceptions('enter all the fields');
      }
    } on FirebaseException catch (e) {
      throw exceptions(e.message.toString());
    }
  }
}
