import 'package:e_services/core/bindings/allbindings.dart';
import 'package:e_services/core/static/font_family.dart';
import 'package:e_services/presentation/booking_cancel/ui/cancel_booking_page.dart';
import 'package:e_services/presentation/main/ui/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EServices extends StatelessWidget {
  const EServices({super.key});
  static final GlobalKey _globalKey = GlobalKey();
  static BuildContext get globalContext =>
      Get.context ?? _globalKey.currentContext!;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: FontFamily.roboto,
      ),
      title: 'E-Services',
      home: MainPage(),
    );
  }
}
