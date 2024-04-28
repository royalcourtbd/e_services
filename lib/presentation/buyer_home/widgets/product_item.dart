import 'package:e_services/core/config/service_app_color.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_services/data/product_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/ui_const.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radius10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(productList[index].icPath),
            gapH10,
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: .0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
                itemSize: 20,
              ),
            ),
            gapH10,
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                productList[index].sellerName,
                style: TextStyle(
                  fontSize: sixteenPx,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                productList[index].serviceName,
                style: TextStyle(
                  fontSize: twelvePx,
                  fontWeight: FontWeight.w400,
                  color: ServiceAppColor.hintTextColor,
                ),
              ),
            ),
            gapH10,
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "€${productList[index].price}/h",
                style: TextStyle(
                  fontSize: twelvePx,
                  fontWeight: FontWeight.w500,
                  color: ServiceAppColor.ultramarineBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
