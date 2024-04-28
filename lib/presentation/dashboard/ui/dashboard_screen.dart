import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/models/profile_model.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/dashboard/model/dashboard_item_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/bindings/base.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    Base.authC.getProfile();
    return Scaffold(
      backgroundColor: ServiceAppColor.scaffoldBgCOlor,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 40.percentWidth,
                decoration: BoxDecoration(
                  color: ServiceAppColor.upComingBoxColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(sixteenPx),
                    bottomRight: Radius.circular(sixteenPx),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Base.authC.profileModel.value != null
                        ? Padding(
                            padding: EdgeInsets.all(twentyPx),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  Base.authC.profileModel.value!.imageLink!),
                              radius: 15,
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(twentyPx),
                            child: const CircleAvatar(
                              radius: 15,
                              child: Icon(Icons.person),
                            ),
                          ),
                    // Padding(
                    //   padding: const EdgeInsets.all(16.0),
                    //   child: CircleAvatar(
                    //     radius: 15,
                    //     backgroundColor: Colors.white.withOpacity(0.3),
                    //     child: SvgPicture.asset(
                    //       SvgPath.icNotification,
                    //       width: 18,
                    //       colorFilter: const ColorFilter.mode(
                    //         Colors.white,
                    //         BlendMode.srcATop,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 45.percentWidth),
              Expanded(
                child: Padding(
                  padding: padding20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Today Booking',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                              fontSize: twelvePx,
                              fontWeight: FontWeight.w400,
                              color: const Color(
                                0xff6B6868,
                              ),
                            ),
                          ),
                        ],
                      ),
                      gapH15,
                      Expanded(
                        child: ListView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return _buildBookingCard(
                                imagePath: SvgPath.imgProfilePic2,
                                label: 'Service Name',
                                price: '€119',
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 30.percentWidth,
            left: twentyPx,
            right: twentyPx,
            child: Container(
              padding: padding6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: GridView.builder(
                itemCount: dashboardItemModel.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                  childAspectRatio: 1 / .5,
                ),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: _buildStatCard(
                      color: dashboardItemModel[index].color,
                      iconPath: dashboardItemModel[index]
                          .iconPath, // Error: The argument type 'String' can't be assigned to the parameter type 'IconData',
                      value: dashboardItemModel[index].value,
                      label: dashboardItemModel[index].label,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required Color color,
    required String iconPath,
    required String value,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: radius10,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 15,
              child: SvgPicture.asset(
                iconPath,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcATop),
              ),
            ),
            gapW10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: twentyPx,
                        fontWeight: FontWeight.w500,
                        color: ServiceAppColor.textColor,
                      ),
                ),
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: twelvePx,
                        fontWeight: FontWeight.w400,
                        color: ServiceAppColor.hintTextColor,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingCard({
    required String imagePath,
    required String label,
    required String price,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
          ),
          gapW10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: fourteenPx,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: twelvePx,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff6B6868),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: ServiceAppColor.completeBoxColor.withOpacity(0.1),
                  borderRadius: radius10,
                ),
                child: Text(
                  'View Details',
                  style: TextStyle(
                    fontSize: twelvePx,
                    fontWeight: FontWeight.w400,
                    color: ServiceAppColor.completeBoxColor,
                  ),
                ),
              ),
              gapW5,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: ServiceAppColor.cancelBoxColor.withOpacity(0.1),
                  borderRadius: radius10,
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: twelvePx,
                    fontWeight: FontWeight.w400,
                    color: ServiceAppColor.cancelBoxColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<DashBoardItemModel> dashboardItemModel = [
  DashBoardItemModel(
    color: const Color(0xff2C67F2),
    value: '12',
    label: 'Today Booking',
    iconPath: SvgPath.icBag,
  ),
  DashBoardItemModel(
    color: ServiceAppColor.completeBoxColor,
    value: '130',
    label: 'Completed',
    iconPath: SvgPath.icComplete,
  ),
  DashBoardItemModel(
    color: ServiceAppColor.upComingBoxColor,
    value: '3',
    label: 'Upcoming',
    iconPath: SvgPath.icCallMisedOut,
  ),
  DashBoardItemModel(
    color: const Color(0xffF8BD00),
    value: '7',
    label: 'Canceled',
    iconPath: SvgPath.icCancelOutline,
  ),
];
