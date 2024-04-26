import 'package:e_services/core/bindings/allbindings.dart';
import 'package:e_services/core/bindings/base.dart';
import 'package:e_services/core/static/font_family.dart';
import 'package:e_services/presentation/login/ui/login_page.dart';
import 'package:e_services/presentation/main/ui/main_page.dart';
import 'package:e_services/presentation/service_page/ui/manage_service_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            scrolledUnderElevation: 0,
          ),
        ),
        title: 'E-Services',
        home: GetStorage().hasData("isLogin")
            ? GetStorage().read("isLogin")
                ? MainPage()
                : LoginPage()
            : LoginPage());
  }
}
