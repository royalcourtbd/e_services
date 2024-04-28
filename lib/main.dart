import 'package:e_services/core/models/profile_model.dart';
import 'package:e_services/presentation/e_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await initial();
  runApp(const EServices());
}

initial() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final dir = await getApplicationDocumentsDirectory();
 await Isar.open(
    [ProfileModelSchema],
    directory: dir.path,
  );
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDA8xkzOABtLpq5qslopSb1J4hVxc8A2ZA",
          appId: "1:354496997593:android:b7a3ceee335232ca0b76c8",
          messagingSenderId: "354496997593",
          storageBucket: 'gs://eservuce.appspot.com',
          projectId: "eservuce"));
}
