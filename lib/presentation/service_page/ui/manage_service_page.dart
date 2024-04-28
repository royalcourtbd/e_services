import 'package:e_services/core/bindings/base.dart';
import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/service_page/ui/add_service_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class ManageServicePage extends StatelessWidget {
  const ManageServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ServiceAppColor.scaffoldBgCOlor,
      appBar: AppBar(
        backgroundColor: ServiceAppColor.scaffoldBgCOlor,
        title: const Text('Manage Service'),
      ),
      body: Padding(
        padding: padding20,
        child: AllServiceList(),
      ),
    );
  }
}

class AllServiceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Base.sellerC.myServiceList.isEmpty
        ? Text("No Service Added")
        : ListView.builder(
            itemCount: Base.sellerC.myServiceList.length,
            itemBuilder: (context, index) {
              final item = Base.sellerC.myServiceList[index];
              return Padding(
                padding: paddingV10,
                child: Container(
                  padding: padding10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: radius10,
                  ),
                  child: Row(
                    children: [
                      // Container(
                      //   height: 100,
                      //   width: 100,
                      //   decoration: BoxDecoration(
                      //     borderRadius: radius10,
                      //     border: Border.all(
                      //       color: Colors.white,
                      //       width: 2,
                      //     ),
                      //   ),
                      //   child: ClipRRect(
                      //     borderRadius: radius10,
                      //     child: Image.asset(
                      //       SvgPath.img2,
                      //       fit: BoxFit.fill,
                      //     ),
                      //   ),
                      // ),
                      // gapW15,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: fivePx, horizontal: twelvePx),
                                  decoration: BoxDecoration(
                                    color: item!.status == "Active"
                                        ? Colors.green.withOpacity(0.1)
                                        : ServiceAppColor.upComingBoxColor
                                            .withOpacity(0.1),
                                    borderRadius: radius10,
                                  ),
                                  child: Text(
                                    item.status!,
                                    style: TextStyle(
                                      color: item.status == "Active"
                                          ? Colors.green
                                          : ServiceAppColor.upComingBoxColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            gapH10,
                            Text(
                              item.description!,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: twelvePx,
                                fontWeight: FontWeight.w400,
                                color: ServiceAppColor.hintTextColor,
                              ),
                            ),
                            gapH10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$ ${item.price!} ${item.unit! ? '/hour' : '/work'}',
                                  style: TextStyle(
                                    fontSize: fourteenPx,
                                    fontWeight: FontWeight.w400,
                                    color: ServiceAppColor.ultramarineBlue,
                                  ),
                                ),
                                gapH10,
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          Base.sellerC.serviceNameController
                                              .value.text = item.serviceName!;
                                          Base.sellerC.serviceName.value =
                                              item.serviceName!;
                                          Base
                                              .sellerC
                                              .serviceDescriptionController
                                              .value
                                              .text = item.serviceName!;
                                          Base.sellerC.serviceDescription
                                              .value = item.description!;
                                          Base.sellerC.servicePriceController
                                              .value.text = item.price!;
                                          Base.sellerC.servicePrice.value =
                                              item.price!;
                                          Base.sellerC.unit.value = item.unit!;
                                          Base.sellerC.selectedId.value =
                                              item.id!;
                                          Base.sellerC.selectedLatLng(
                                              LatLng(item.lat!, item.lng!));
                                          Get.to(() => AddServicePage(
                                                isEdit: true,
                                              ));
                                        },
                                        child:
                                            SvgPicture.asset(SvgPath.icEdit)),
                                    gapW10,
                                    GestureDetector(
                                        onTap: () async {
                                          await Base.sellerC
                                              .deleteService(item.id!);
                                        },
                                        child:
                                            SvgPicture.asset(SvgPath.icDelete)),
                                    ...[
                                      gapW10,
                                      GestureDetector(
                                        onTap: () async {
                                          await Base.sellerC
                                              .serviceEnableDisable(
                                                  item.id!,
                                                  item.status == "Active"
                                                      ? false
                                                      : true);
                                        },
                                        child: SvgPicture.asset(
                                          SvgPath.icServiceError,
                                          color: item.status == "Active"
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ),
                                    ]
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
