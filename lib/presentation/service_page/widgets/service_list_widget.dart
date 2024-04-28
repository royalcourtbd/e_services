import 'package:e_services/core/bindings/base.dart';
import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/static/svg_path.dart';

class ServiceListWidget extends StatelessWidget {
  const ServiceListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: Base.sellerC.myServiceList.isEmpty
            ? const Text("No Service Added")
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
                          item!.image != ''
                              ? Container(
                                  height: 150,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: radius10,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: radius10,
                                    child: Image.network(item.image!),
                                  ),
                                )
                              : Container(
                                  height: 150,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: radius10,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: radius10,
                                    child: Icon(Icons.photo),
                                  ),
                                ),
                          gapW15,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Row(
                                //   children: [
                                //     const Icon(Icons.star, color: Colors.yellow),
                                //     Text(
                                //       '5.0',
                                //       style: TextStyle(
                                //         fontSize: fourteenPx,
                                //         fontWeight: FontWeight.w400,
                                //         color: Colors.yellow,
                                //       ),
                                //     ),
                                //     gapW5,
                                //     Text(
                                //       '(120)',
                                //       style: TextStyle(
                                //         fontSize: fourteenPx,
                                //         fontWeight: FontWeight.w400,
                                //         color: ServiceAppColor.subtitleColor,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                Text(
                                  item!.serviceName!,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: sixteenPx,
                                    fontWeight: FontWeight.w400,
                                    color: ServiceAppColor.hintTextColor,
                                  ),
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
                                Text(
                                  '\$ ${item.price!}',
                                  style: TextStyle(
                                    fontSize: fourteenPx,
                                    fontWeight: FontWeight.w400,
                                    color: ServiceAppColor.ultramarineBlue,
                                  ),
                                ),
                                gapH10,
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: fivePx, horizontal: twelvePx),
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.1),
                                      borderRadius: radius10,
                                    ),
                                    child: Text(
                                      item.status!,
                                      style: TextStyle(
                                        color: item.status == "Active"
                                            ? Colors.green
                                            : Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
