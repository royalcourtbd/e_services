import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:e_services/presentation/buyer_booking/ui/buyer_booking_page.dart';
import 'package:e_services/presentation/buyer_home/home_page_2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_services/presentation/main/ui/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

import '../../core/models/my_service_model.dart';
import '../../core/models/profile_model.dart';
import '../service_page/ui/service_page.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class BuyerService extends GetxController {
  final serviceNameController =
      Rx<TextEditingController>(TextEditingController());
  final mapController = MapController();
  final serviceDescriptionController =
      Rx<TextEditingController>(TextEditingController());
  final servicePriceController =
      Rx<TextEditingController>(TextEditingController());
  final selectedCategory = RxString('Select Item');
  final serviceName = RxString('');
  final serviceDescription = RxString('');
  final selectedId = RxString('');
  final unit = RxBool(false);
  final servicePrice = RxString('');
  final image = Rx<File?>(null);
  final selectedDate = Rx<DateTime?>(DateTime.now());
  final categoryList = RxList<String>();
  final allServiceList = RxList<MyServiceModel?>([]);
  final myBookingList = RxList<MyServiceModel?>([]);
  final catServiceList = RxList<MyServiceModel?>([]);
  final currentLatLng = Rx<LatLng?>(null);
  final selectedLatLng = Rx<LatLng?>(LatLng(0, 0));
  @override
  void onInit() async {
    await getCategories();
    await getCurrentLatLng();
    await getAllServices();
    super.onInit();
  }

  getProfile() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [ProfileModelSchema],
      directory: dir.path,
    );

    final existingEmail = isar.profileModels.name;
    log(existingEmail);
  }

  updateMarkerPosition(LatLng tappedPoint) {
    final latLng = LatLng(
      tappedPoint.latitude,
      tappedPoint.longitude,
    );
    selectedLatLng(latLng);
  }

  bookService(MyServiceModel services) async {
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
      final firestore = FirebaseFirestore.instance;

      final emailAddrss = GetStorage().read('email');
      await firestore.collection('book').add({
        'userMail': emailAddrss,
        "id": services.id,
        "service_name": services.serviceName,
        'cat': services.cat,
        "price": services.price,
        "lat": services.lat,
        "lng": services.lng,
        "description": services.description,
        "email": services.email,
        'image': services.image,
        'date': DateFormat("yyyy-MM-dd").format(selectedDate.value!)
      }).then((value) async {});
      Get.back();
      Get.snackbar("Book Service", "Service Booked Successfully");
      Get.offAll(() => const BuyerBookingPage());
    } catch (e, s) {
      Get.back();
      log(e.toString());
      log(s.toString());
    }
  }

  Future<String> uploadImage(String emailAddrss, String id) async {
    String link = '';
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('$emailAddrss/$id');

    firebase_storage.UploadTask uploadTask = ref.putFile(image.value!);

    await uploadTask.whenComplete(() async {
      final x = await ref.getDownloadURL();
      final firestore = FirebaseFirestore.instance;
      link = x;
      await firestore
          .collection('service')
          .doc(id)
          .update({"id": id, 'image': link});
    });
    return link;
  }

  getServiceByCategory(String catName) async {
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
      catServiceList.clear();
      FirebaseFirestore.instance
          .collection('service')
          .where('cat', isEqualTo: catName)
          .get()
          .then((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          // Assuming only one document matches the email, you can access it using querySnapshot.docs[0]
          List<DocumentSnapshot> documentSnapshot = querySnapshot.docs;

          for (var element in documentSnapshot) {
            Map<String, dynamic> userData =
                element.data() as Map<String, dynamic>;
            final raw = MyServiceModel.fromJson(userData);
            raw.id = querySnapshot
                .docs[documentSnapshot.indexOf(element)].reference.id;

            catServiceList.add(raw);
          }
        }
      });
      Get.back();
    } catch (e) {
      print(e);
    } finally {
      Get.to(() => BuyerHomePage2(
            isList: true,
          ));
    }
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

  pickImage() async {
    final x = await ImagePicker().pickImage(source: ImageSource.camera);
    if (x != null) {
      image(File(x.path));
    }
  }

  getCategories() async {
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

  saveService() async {
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
      final firestore = FirebaseFirestore.instance;

      final emailAddrss = GetStorage().read('email');
      await firestore.collection('service').add({
        "id": '1',
        "service_name": serviceName.value,
        "price": servicePrice.value,
        "lat": selectedLatLng.value!.latitude,
        "lng": selectedLatLng.value!.longitude,
        "description": serviceDescription.value,
        "email": emailAddrss,
        "status": "Active",
        'image': '',
        "unit": unit.value
      }).then((value) async {
        await uploadImage(emailAddrss, value.id);
      });
      Get.back();
      Get.snackbar("Add Service", "Service Saved Successfully");
      Get.offAll(() => MainPage());
    } catch (e) {
      Get.back();
      log(e.toString());
    }
  }

  getAllServices() async {
    try {
      FirebaseFirestore.instance
          .collection('service')
          .get()
          .then((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          // Assuming only one document matches the email, you can access it using querySnapshot.docs[0]
          List<DocumentSnapshot> documentSnapshot = querySnapshot.docs;
          log(querySnapshot.docs.toString());
          allServiceList.clear();
          for (var element in documentSnapshot) {
            Map<String, dynamic> userData =
                element.data() as Map<String, dynamic>;
            final raw = MyServiceModel.fromJson(userData);
            raw.id = querySnapshot
                .docs[documentSnapshot.indexOf(element)].reference.id;

            allServiceList.add(raw);
          }
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  getMyBookingServices() async {
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

      final emailAddrss = GetStorage().read('email');
      myBookingList.clear();
      FirebaseFirestore.instance
          .collection('book')
          .where('userMail', isEqualTo: emailAddrss)
          .get()
          .then((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          // Assuming only one document matches the email, you can access it using querySnapshot.docs[0]
          List<DocumentSnapshot> documentSnapshot = querySnapshot.docs;

          for (var element in documentSnapshot) {
            Map<String, dynamic> userData =
                element.data() as Map<String, dynamic>;
            final raw = MyServiceModel.fromJson(userData);
            raw.id = querySnapshot
                .docs[documentSnapshot.indexOf(element)].reference.id;

            myBookingList.add(raw);
          }
        }
      });
    } catch (e) {
      log(e.toString());
    } finally {
      Get.back();

      Get.offAll(() => const BuyerBookingPage());
    }
  }
}
