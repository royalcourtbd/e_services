// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_services/data/product_data.dart';
import 'package:e_services/data/service_data.dart';
import 'package:e_services/presentation/buyer_home/widgets/product_item.dart';
import 'package:e_services/presentation/common/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/common/text_box.dart';

class BuyerHomePage extends StatelessWidget {
  BuyerHomePage({super.key});

  final TextEditingController textEditingController = TextEditingController();

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
          gapW10,
        ],
      ),
      body: Padding(
        padding: padding20,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBox(
                hintText: 'Search Here',
                textEditingController: textEditingController,
                bgColor: Colors.white,
                border: Border.all(width: 0, color: Colors.white),
                isSearch: true,
              ),
              gapH20,
              Container(
                height: 50.percentWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: CarouselSlider.builder(
                  //scrollPhysics: const NeverScrollableScrollPhysics(),
                  slideIndicator: CircularSlideIndicator(
                    padding: const EdgeInsets.only(bottom: 15),
                  ),
                  slideTransform: const DefaultTransform(),
                  unlimitedMode: true,
                  //autoSliderDelay: const Duration(seconds: 3),
                  autoSliderTransitionTime: const Duration(seconds: 5),
                  enableAutoSlider: false,
                  itemCount: 3,

                  slideBuilder: (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: padding20,
                        width: 200, // Set the width as needed

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: radius10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Get 30% on repairing',
                                  style: TextStyle(
                                      fontSize: eighteenPx,
                                      fontWeight: FontWeight.w500),
                                ),
                                gapH5,
                                Text(
                                  ' Code: AFR34',
                                  style: TextStyle(
                                      fontSize: twelvePx,
                                      fontWeight: FontWeight.w400),
                                ),
                                gapH20,
                                const SizedBox(
                                    width: 150,
                                    child:
                                        SubmitButton(buttonTitle: 'Book Now'))
                              ],
                            ),
                            SvgPicture.asset('assets/images/svg/setting2.svg')
                          ],
                        ),
                        // Other widget properties can be added here (e.g., child, alignment, etc.)
                      ),
                    );
                  },
                ),
              ),
              gapH20,
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: twentyPx,
                  fontWeight: FontWeight.w500,
                ),
              ),
              gapH20,
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: serviceModelList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: radius10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(serviceModelList[index].icPath),
                        gapH10,
                        Text(serviceModelList[index].title),
                      ],
                    ),
                  );
                },
              ),
              gapH25,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Services',
                    style: TextStyle(
                      fontSize: twentyPx,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: twelvePx,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              gapH20,
              SizedBox(
                height: 80.percentWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ProductItems(index: index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
