import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/data/product_data.dart';
import 'package:e_services/presentation/buyer_home/widgets/product_item.dart';
import 'package:e_services/presentation/common/submit_button.dart';
import 'package:e_services/presentation/common/text_box.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class BuyerHomePage2 extends StatelessWidget {
  BuyerHomePage2({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: [
              TextBox(
                hintText: 'Search Here',
                textEditingController: _controller,
                bgColor: Colors.white,
                border: Border.all(color: Colors.white),
                isSearch: true,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        padding: padding4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            gapW5,
                            const Text('Location'),
                            const Icon(Icons.arrow_drop_down_outlined)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              gapH10,
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Searched by “washing service”')),
              gapH10,
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.4,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) => ProductItems(
                  index: index,
                ),
              ),
              gapH10,
              SizedBox(
                width: 200,
                child: SubmitButton(
                  buttonTitle: 'Next Page',
                  fontSize: twelvePx,
                  image: SvgPicture.asset(
                    SvgPath.icArrowRightCorner,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
