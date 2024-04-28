import 'package:e_services/core/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';


class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> saveData(ProfileModel newData) async {
 
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.profileModels.putSync(newData));
 
  }

  Future<ProfileModel> getAllData() async {
    final isar = await db;
    final x = await isar.profileModels.get(0);
    //log('id: ${x.first.id}, date: ${x.first.date}, description: ${x.first.description}, amount: ${x.first.amount}, month: ${x.first.monthName}');
    return x!;
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [ProfileModelSchema],
        directory: dir.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
}