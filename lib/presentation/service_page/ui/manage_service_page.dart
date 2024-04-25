import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ManageServicePage extends StatelessWidget {
  const ManageServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ServiceAppColor.scaffoldBgCOlor,
        appBar: AppBar(
          backgroundColor: ServiceAppColor.scaffoldBgCOlor,
          title: const Text('Manage Service'),
          bottom: const TabBar(
            labelColor: ServiceAppColor.ultramarineBlue,
            unselectedLabelColor: ServiceAppColor.hintTextColor,
            indicatorColor: ServiceAppColor.ultramarineBlue,
            tabs: [
              Tab(
                text: 'All (2)',
              ),
              Tab(
                text: 'Drafts (4)',
              ),
            ],
          ),
        ),
        body: Padding(
          padding: padding20,
          child: const TabBarView(children: [
            AllServiceList(
              isActive: true,
              length: 3,
            ),
            AllServiceList(
              isActive: false,
              length: 5,
            ),
          ]),
        ),
      ),
    );
  }
}

class AllServiceList extends StatelessWidget {
  const AllServiceList({
    super.key,
    required this.isActive,
    required this.length,
  });

  final bool isActive;
  final int length;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, index) {
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
                Container(
                  height: 100,
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
                    child: Image.asset(
                      SvgPath.img2,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                gapW15,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(
                            children: [
                              TextSpan(
                                text: '⭐ 5.0',
                                style: TextStyle(
                                  fontSize: fourteenPx,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.yellow,
                                ),
                              ),
                              TextSpan(
                                text: ' (120)',
                                style: TextStyle(
                                  fontSize: fourteenPx,
                                  fontWeight: FontWeight.w400,
                                  color: ServiceAppColor.subtitleColor,
                                ),
                              ),
                            ],
                          )),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: fivePx, horizontal: twelvePx),
                            decoration: BoxDecoration(
                              color: isActive
                                  ? Colors.green.withOpacity(0.1)
                                  : ServiceAppColor.upComingBoxColor
                                      .withOpacity(0.1),
                              borderRadius: radius10,
                            ),
                            child: Text(
                              isActive ? 'Active' : 'Publish',
                              style: TextStyle(
                                color: isActive
                                    ? Colors.green
                                    : ServiceAppColor.upComingBoxColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      gapH10,
                      Text(
                        'Lorem ipsum dolor sit amet, Semper a qusatas commodo aliquam erat orci.',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: twelvePx,
                          fontWeight: FontWeight.w400,
                          color: ServiceAppColor.hintTextColor,
                        ),
                      ),
                      gapH10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '€40.00/h',
                            style: TextStyle(
                              fontSize: fourteenPx,
                              fontWeight: FontWeight.w400,
                              color: ServiceAppColor.ultramarineBlue,
                            ),
                          ),
                          gapH10,
                          Row(
                            children: [
                              SvgPicture.asset(SvgPath.icEdit),
                              gapW10,
                              SvgPicture.asset(SvgPath.icDelete),
                              if (isActive) ...[
                                gapW10,
                                SvgPicture.asset(SvgPath.icServiceError),
                              ]
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
