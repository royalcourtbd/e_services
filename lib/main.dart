import 'package:e_services/presentation/e_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  await initial();
  runApp(const EServices());
}

initial() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
