import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? get currentuser => firebaseAuth.currentUser;
  Stream<User?> get authstatechanges => firebaseAuth.authStateChanges();

  Future<void> signInwithemailpass(String email, String password) async {
    try {
      final x = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      log(x.toString());
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      Get.snackbar('Login Failed', "Please signup first");
    }
  }

  Future<void> signUpwithemailpass(String email, String password) async {
    try {
      final d = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      log(d.toString());
      if(d.toString().contains("isNewUser: true")){
        
      }
    } catch (e, s) {
      log('ssss $e.toString()}');
      if (e.toString().contains(" Password should be at least 6")) {
        Get.snackbar('Password Error', "Password should be at least 6");
      } else if (e.toString().contains("The email address is badly")) {
        Get.snackbar('Email Error', "Email address not valid");
      } else {
        Get.snackbar('Sign Up Failed', "Please signup again");
      }
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
