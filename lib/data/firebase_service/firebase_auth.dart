import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gibibooks/data/firebase_service/firestore.dart';
import 'package:gibibooks/data/firebase_service/storage.dart';
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
    String URL;
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          Bio.isNotEmpty) {
        if (password == passwordConfirm) {
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());

          // upload profile pic to storage
          if (profile != File('')) {
            URL = await StorageMethod()
                .uploadImageToStorage('Profile Picture', profile);
          } else {
            URL = '';
          }

          //get info with firestore
          await Firebase_Firestore().CreateUser(
            email: email,
            username: username,
            Bio: Bio,
            profile: URL == ''
                ? 'https://firebasestorage.googleapis.com/v0/b/gibibook-22974.appspot.com/o/person.png?alt=media&token=bbe58ed1-4b00-4e75-9f0b-7ab652eb0e3b'
                : URL,
          );
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
