import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 40.percentWidth,
                decoration: BoxDecoration(
                  color: Color(0xff8F2CF2),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(sixteenPx),
                    bottomRight: Radius.circular(sixteenPx),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(SvgPath.imgProfilePic2),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SvgPicture.asset(
                        SvgPath.icNotification,
                        height: 24.0,
                        width: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              gapH50,
              gapH50,
              gapH50,
              gapH50,
              Expanded(
                child: Container(
                  color: ServiceAppColor.scaffoldBgCOlor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Today Booking',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            _buildBookingCard(
                              imagePath: SvgPath.img1,
                              label: 'Room cleaning',
                              price: '\€119',
                            ),
                            _buildBookingCard(
                              imagePath: SvgPath.img1,
                              label: 'Office cleaning',
                              price: '\€120',
                            ),
                            _buildBookingCard(
                              imagePath: SvgPath.img1,
                              label: 'Room cleaning',
                              price: '\€80',
                            ),
                            _buildBookingCard(
                              imagePath: SvgPath.img1,
                              label: 'Room cleaning',
                              price: '\€99',
                            ),
                            _buildBookingCard(
                              imagePath: SvgPath.img1,
                              label: 'Room cleaning',
                              price: '',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 120,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatCard(
                          color: Colors.blue,
                          iconData: Icons.calendar_today,
                          value: '12',
                          label: 'Today Booking',
                        ),
                        _buildStatCard(
                          color: Colors.teal,
                          iconData: Icons.check_circle,
                          value: '130',
                          label: 'Completed',
                        ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatCard(
                        color: Colors.purple,
                        iconData: Icons.arrow_upward,
                        value: '3',
                        label: 'Upcoming',
                      ),
                      _buildStatCard(
                        color: Colors.amber,
                        iconData: Icons.cancel,
                        value: '7',
                        label: 'Canceled',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required Color color,
    required IconData iconData,
    required String value,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildBookingCard({
    required String imagePath,
    required String label,
    required String price,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(label),
      subtitle: Text(price),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {
              // Handle view details
            },
            child: Text('View details'),
          ),
          TextButton(
            onPressed: () {
              // Handle cancel
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
