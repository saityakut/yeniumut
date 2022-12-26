import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  signInWithEmailandPassword(String? email, String? password) async {
    try {
      UserCredential sonuc = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      //debugPrint('sonuç : $sonuc');
      return true;
    } catch (e) {
      debugPrint('user login exception : $e');
      return false;
    }
  }
}
