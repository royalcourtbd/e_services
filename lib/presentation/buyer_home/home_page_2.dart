import 'package:e_services/core/bindings/base.dart';
import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/buyer_home/widgets/product_item.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../buyer_booking/book_service_page.dart';

class BuyerHomePage2 extends StatelessWidget {
  BuyerHomePage2({Key? key, required this.isList}) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  bool isList;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: ServiceAppColor.scaffoldBgCOlor,
        appBar: AppBar(
          backgroundColor: ServiceAppColor.scaffoldBgCOlor,
          leading: const Icon(
            Icons.menu,
            color: Colors.blue,
          ),
          actions: [
            SvgPicture.asset(
              SvgPath.icNotification,
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: Padding(
          padding: padding20,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isList
                    ? Base.buyerC.catServiceList.isEmpty
                        ? Center(child: Text('No Service Available'))
                        : GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 1.4,
                            ),
                            itemCount: Base.buyerC.catServiceList.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () async {
                                await Base.sellerC.getCurrentLatLng();
                                Get.to(() => BookServicePage(
                                      item: Base.buyerC.catServiceList[index]!,
                                    ));
                              },
                              child: ProductItems(
                                indexV: Base.buyerC.catServiceList[index]!,
                              ),
                            ),
                          )
                    : GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.4,
                        ),
                        itemCount: Base.buyerC.allServiceList.length,
                        itemBuilder: (context, index) => ProductItems(
                          indexV: Base.buyerC.allServiceList[index]!,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
