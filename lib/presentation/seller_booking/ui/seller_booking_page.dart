import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/seller_booking/model/seller_booking_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellerBookingPage extends StatelessWidget {
  const SellerBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ServiceAppColor.scaffoldBgCOlor,
      appBar: AppBar(
        title: const Text('Manage Booking'),
        backgroundColor: ServiceAppColor.scaffoldBgCOlor,
        actions: [
          SvgPicture.asset(SvgPath.icNotification),
          gapW20,
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _myBookingList.length,
              shrinkWrap: true,
              padding: padding20,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15.0, bottom: 10.0),
                        child: Text(
                          _myBookingList[index].dateAndTime,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: fourteenPx,
                                    fontWeight: FontWeight.w500,
                                    color: ServiceAppColor.textColor,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
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
                                        offset: const Offset(1,
                                            1), // X, Y offsets from the container
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
                                            color:
                                                ServiceAppColor.ultramarineBlue,
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
                                            color:
                                                ServiceAppColor.hintTextColor,
                                          ),
                                    ),
                                    gapH6,
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
                                  ],
                                ),
                              ],
                            ),
                            gapH15,
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      const AssetImage(SvgPath.imgProfilePic2),
                                  maxRadius: fifteenPx,
                                ),
                                gapW15,
                                Text(
                                  _myBookingList[index].customerName!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: fourteenPx,
                                        fontWeight: FontWeight.w400,
                                        color: ServiceAppColor.textColor,
                                      ),
                                ),
                                const Spacer(),
                                Container(
                                  width: 22.percentWidth,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: radius8,
                                    color: _myBookingList[index]
                                        .color
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
                                          color: _myBookingList[index].color,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: padding20,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'See All',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: fourteenPx,
                    fontWeight: FontWeight.w400,
                    color: ServiceAppColor.hintTextColor,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
          gapH30,
        ],
      ),
    );
  }
}

List<SellerBookingModel> _myBookingList = [
  SellerBookingModel(
      serviceName: 'Cleaner',
      dateAndTime: '15 January 2024',
      employeeName: 'Shehnaz dey',
      customerName: 'Jane Cooper',
      price: 40.0,
      status: 'Complete',
      image: SvgPath.img1,
      color: ServiceAppColor.completeBoxColor),
  SellerBookingModel(
      serviceName: 'Carpenter',
      dateAndTime: '15 January 2024',
      employeeName: 'James William',
      customerName: 'Jane Cooper',
      price: 40.0,
      status: 'Cancel',
      image: SvgPath.img2,
      color: ServiceAppColor.cancelBoxColor),
  SellerBookingModel(
      serviceName: 'Washing',
      dateAndTime: '15 January 2024',
      employeeName: 'Shehnaz dey',
      customerName: 'Jane Cooper',
      price: 40.0,
      status: 'Complete',
      image: SvgPath.img3,
      color: ServiceAppColor.completeBoxColor),
  SellerBookingModel(
      serviceName: 'Cleaner',
      dateAndTime: '15 January 2024',
      employeeName: 'Shehnaz dey',
      customerName: 'Jane Cooper',
      price: 40.0,
      status: 'Complete',
      image: SvgPath.img1,
      color: ServiceAppColor.completeBoxColor),
  SellerBookingModel(
    serviceName: 'Carpenter',
    dateAndTime: '15 January 2024',
    employeeName: 'James William',
    customerName: 'Jane Cooper',
    price: 40.0,
    status: 'Cancel',
    image: SvgPath.img2,
    color: ServiceAppColor.cancelBoxColor,
  ),
];
