import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

import 'package:location/location.dart';

class SellerService extends GetxController {
  final serviceNameController = TextEditingController();
  final mapController = MapController();
  final serviceDescriptionController = TextEditingController();
  final servicePriceController = TextEditingController();
  final selectedCategory = RxString('Select Item');
  final categoryList = RxList<String>();
  final currentLatLng = Rx<LatLng?>(null);
  final selectedLatLng = Rx<LatLng?>(null);
  @override
  void onInit() async {
    await getData();
    await getCurrentLatLng();
    super.onInit();
  }

  updateMarkerPosition(LatLng tappedPoint) {
    final latLng = LatLng(
      tappedPoint.latitude,
      tappedPoint.longitude,
    );
    selectedLatLng(latLng);
  }

  getCurrentLatLng() async {
    final permissionGranted = await Geolocator.checkPermission();
    if (permissionGranted != LocationPermission.denied) {
      final locations = await Geolocator.getCurrentPosition();

      final latLng = LatLng(
        locations.latitude,
        locations.longitude,
      );

      currentLatLng(latLng);
    } else {
      await Geolocator.requestPermission();
    }
  }

  getData() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('listData')
        .doc('data')
        .get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      List<Map<String, dynamic>> listData =
          List<Map<String, dynamic>>.from(data['list']);

      // Now you can use this data as needed
      log(listData.toString());

      categoryList.addAll(listData.map((e) => e["categoryname"]));
    }
  }
}
