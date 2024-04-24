import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShowServiceCard extends StatelessWidget {
  const ShowServiceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding20,
      child: Container(
        width: double.infinity,
        padding: padding15,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(twentyPx),
            border: Border.all(
              color: const Color(0xffF3F3F3),
              width: 2,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: radius15,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.15), // Shadow color with opacity
                        blurRadius: 13.9, // Blur radius
                        offset: const Offset(
                            1, 1), // X, Y offsets from the container
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: radius12,
                    child: Image.asset(
                      SvgPath.img2,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
                gapW20,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shehnaz dey',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: eighteenPx,
                            fontWeight: FontWeight.w500,
                            color: ServiceAppColor.textColor,
                          ),
                    ),
                    gapH6,
                    Text(
                      'Cleaner',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: twelvePx,
                            fontWeight: FontWeight.w400,
                            color: ServiceAppColor.hintTextColor,
                          ),
                    ),
                    gapH6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: .0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                          itemSize: 20,
                        ),
                        gapW10,
                        Text(
                          '(120)',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: fourteenPx,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff6B6868),
                                  ),
                        ),
                        gapW15,
                      ],
                    ),
                    gapH10,
                    Text(
                      '€40.00/h',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: fourteenPx,
                            fontWeight: FontWeight.w500,
                            color: ServiceAppColor.ultramarineBlue,
                          ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
