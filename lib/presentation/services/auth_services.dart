import 'dart:developer';

import 'package:e_services/presentation/my_booking_page.dart/ui/my_booking_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isCustomer = RxBool(false);

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? get currentuser => firebaseAuth.currentUser;
  Stream<User?> get authstatechanges => firebaseAuth.authStateChanges();

  Future<void> signInwithemailpass(String email, String password) async {
    try {
      Get.dialog(
        Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
      final x = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.back();
      log(x.toString());
      if (x.toString().contains("UserCredential")) {
        GetStorage().write("isLogin", true);
        Get.to(() => MyBookingPage());
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      Get.back();
      Get.snackbar('Login Failed', "Please signup first");
    } finally {}
  }

  Future<void> signUpwithemailpass(
      String email, String password, bool isBuyer) async {
    try {
      Get.dialog(
        Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
      final d = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      log(d.toString());
      Get.back();
      if (d.toString().contains("isNewUser: true")) {
        Get.back();
        Get.snackbar('Sign Up Successful', "Successfully SignUp");
        await firestore.collection('users').doc(d.user!.uid).set({
          'is': false, // Example boolean value
        });
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
      Get.back();
    } finally {}
  }

  Future<void> signOut() async {
    final x = await firebaseAuth.signOut();
  }
}
