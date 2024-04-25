import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewCancelledPage extends StatelessWidget {
  const ViewCancelledPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ServiceAppColor.scaffoldBgCOlor,
      body: SafeArea(
        child: Padding(
          padding: padding20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                SvgPath.icRedClose,
                height: 100,
                width: 100,
              ),
              gapH16,
              Text(
                'Booking Cancelled!',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: twentyPx,
                      fontWeight: FontWeight.w500,
                      color: ServiceAppColor.cancelBoxColor,
                    ),
              ),
              gapH16,
              Text(
                'Lorem ipsum dolor sit amet consectetur. Id porttitor blandit at libero et suscipit dictum. Purus aliquet sit platea sit semper etiam integer tellus eu.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: sixteenPx,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff6B6868),
                    ),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                padding: padding15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(twentyPx),
                ),
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
                                color: Colors.black.withOpacity(
                                    0.15), // Shadow color with opacity
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: eighteenPx,
                                    fontWeight: FontWeight.w500,
                                    color: ServiceAppColor.textColor,
                                  ),
                            ),
                            gapH6,
                            Text(
                              'Cleaner',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
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
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: .0),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: fourteenPx,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff6B6868),
                                      ),
                                ),
                                gapW15,
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              gapH30,
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: fiftyPx,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: radius10,
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        ServiceAppColor.upComingBoxColor, // #8F2CF2
                        Color(0xFF2C67F2), // #2C67F2
                      ],
                      stops: [0.0, 1.0],
                    ),
                  ),
                  child: Text(
                    'Go Back',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: twentyPx,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
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
