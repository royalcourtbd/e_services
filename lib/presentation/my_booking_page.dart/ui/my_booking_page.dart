import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/models/my_booking_model.dart';

class MyBookingPage extends StatelessWidget {
  const MyBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ServiceAppColor.scaffoldBgCOlor,
      appBar: AppBar(
        backgroundColor: ServiceAppColor.scaffoldBgCOlor,
        title: Text(
          'My Booking',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: twentyPx,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [SvgPicture.asset(SvgPath.icNotification), gapW20],
      ),
      body: ListView.builder(
        itemCount: _myBookingList.length,
        shrinkWrap: true,
        padding: padding20,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: tenPx),
            child: Container(
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
                            _myBookingList[index].image,
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
                            '€${_myBookingList[index].price}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: twelvePx,
                                  fontWeight: FontWeight.w400,
                                  color: ServiceAppColor.ultramarineBlue,
                                ),
                          ),
                          gapH6,
                          Text(
                            _myBookingList[index].serviceName,
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
                              Text(
                                _myBookingList[index].employeeName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: fourteenPx,
                                      fontWeight: FontWeight.w400,
                                      color: ServiceAppColor.textColor,
                                    ),
                              ),
                              gapW15,
                              Container(
                                width: 22.percentWidth,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: radius8,
                                  color:
                                      _myBookingList[index].status == 'Cancel'
                                          ? ServiceAppColor.cancelBoxColor
                                              .withOpacity(0.1)
                                          : ServiceAppColor.completeBoxColor
                                              .withOpacity(0.1),
                                ),
                                child: Text(
                                  _myBookingList[index].status,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: fourteenPx,
                                        fontWeight: FontWeight.w400,
                                        color: _myBookingList[index].status ==
                                                'Cancel'
                                            ? ServiceAppColor.cancelBoxColor
                                            : ServiceAppColor.completeBoxColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  gapH15,
                  Text(
                    _myBookingList[index].dateAndTime,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: fourteenPx,
                          fontWeight: FontWeight.w500,
                          color: ServiceAppColor.textColor,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

List<MyBookingModel> _myBookingList = [
  MyBookingModel(
    serviceName: 'Cleaner',
    dateAndTime: '15 January 2024',
    employeeName: 'Shehnaz dey',
    price: 40.0,
    status: 'Complete',
    image: SvgPath.img1,
  ),
  MyBookingModel(
    serviceName: 'Carpenter',
    dateAndTime: '15 January 2024',
    employeeName: 'James William',
    price: 40.0,
    status: 'Cancel',
    image: SvgPath.img2,
  ),
  MyBookingModel(
    serviceName: 'Washing',
    dateAndTime: '15 January 2024',
    employeeName: 'Shehnaz dey',
    price: 40.0,
    status: 'Complete',
    image: SvgPath.img3,
  ),
  MyBookingModel(
    serviceName: 'Cleaner',
    dateAndTime: '15 January 2024',
    employeeName: 'Shehnaz dey',
    price: 40.0,
    status: 'Complete',
    image: SvgPath.img1,
  ),
];
