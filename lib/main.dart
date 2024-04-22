import 'package:e_services/presentation/e_services.dart';
import 'package:flutter/material.dart';

void main() async {
  await initial();
  runApp(const EServices());
}

initial() async {
  WidgetsFlutterBinding.ensureInitialized();
}
