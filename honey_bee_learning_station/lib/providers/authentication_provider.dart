import 'dart:async';
import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String userUid = '';
  String get getUserUId => userUid;

  Future LogintoAccount(String email, String Password) async {
    try {
      print("Recieved Email and Pass are" + email + " " + Password);
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: Password);
      // email: "barry.allen@example.com", password: "SuperSecretPassword!");
      User? user = userCredential.user;
      if (user != null) {
        userUid = user.uid;
        print("User Id is :- " + userUid);
        notifyListeners();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  // create account

  // Reset Password

  Future SignOut() async {
    return await auth.signOut();
  }
}
