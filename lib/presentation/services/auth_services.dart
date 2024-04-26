import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_services/presentation/login/ui/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isCustomer = RxBool(true);

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
        GetStorage().write("email", email);
        FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: email)
            .get()
            .then((QuerySnapshot querySnapshot) {
          if (querySnapshot.docs.isNotEmpty) {
            // Assuming only one document matches the email, you can access it using querySnapshot.docs[0]
            DocumentSnapshot documentSnapshot = querySnapshot.docs[0];
            Map<String, dynamic> userData =
                documentSnapshot.data() as Map<String, dynamic>;
            log(userData.toString());
            log(userData["isCustomer"].toString());
            GetStorage().write(
                "isCustomer", userData["isCustomer"] == "true" ? true : false);
          }
        });

        // Get.to(() => GetStorage().read("isCustomer")
        //     ? const DashboardScreen()
        //     : const DashboardScreen());
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
          'isCustomer': isBuyer, 'email': email, // Example boolean value
        });
      } else if (d
          .toString()
          .contains("The email address is already in use by another account")) {
        Get.back();
        Get.snackbar('Email used', "Email used already");
      }
    } catch (e) {
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
    try {
      await firebaseAuth.signOut();
      GetStorage().remove("isLogin");
      Get.offAll(() => LoginPage());
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }
}
