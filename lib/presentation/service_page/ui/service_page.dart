import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/service_page/ui/add_service_page.dart';
import 'package:e_services/presentation/service_page/ui/manage_service_page.dart';
import 'package:e_services/presentation/service_page/widgets/service_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ServiceAppColor.scaffoldBgCOlor,
      appBar: AppBar(
        title: const Text('Service'),
      ),
      body: Padding(
        padding: padding20,
        child: Column(
          children: [
            Container(
              padding: padding20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: radius10,
              ),
              child: Column(
                children: [
                  SvgPicture.asset(SvgPath.icHex),
                  gapH25,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Get.to( AddServicePage(isEdit: false,)),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: tenPx, horizontal: fifteenPx),
                              decoration: BoxDecoration(
                                borderRadius: radius8,
                                border: Border.all(
                                  color: ServiceAppColor.upComingBoxColor,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                'Add new service',
                                style: TextStyle(
                                  fontSize: fourteenPx,
                                  fontWeight: FontWeight.w400,
                                  color: ServiceAppColor.upComingBoxColor,
                                ),
                              ),
                            ),
                          ),
                          gapW10,
                          InkWell(
                            onTap: () {
                              // Get.snackbar(
                              //     "Under Development", "Work In Progress");
                              Get.to(() => const ManageServicePage());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: tenPx, horizontal: fifteenPx),
                              decoration: BoxDecoration(
                                color: ServiceAppColor.upComingBoxColor,
                                borderRadius: radius8,
                              ),
                              child: Text(
                                'Manage service',
                                style: TextStyle(
                                  fontSize: fourteenPx,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            gapH30,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'My service',
                style: TextStyle(
                  fontSize: twentyPx,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            gapH18,
            const ServiceListWidget(),
          ],
        ),
      ),
    );
  }
}
