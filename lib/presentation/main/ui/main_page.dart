import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/presentation/booking/ui/booking_list_page.dart';
import 'package:e_services/presentation/booking_cancel/ui/cancel_booking_page.dart';
import 'package:e_services/presentation/booking_cancel/ui/view_cancel_page.dart';
import 'package:e_services/presentation/dashboard/ui/dashboard_screen.dart';
import 'package:e_services/presentation/main/presenter/main_presenter.dart';
import 'package:e_services/presentation/message/ui/message_page.dart';
import 'package:e_services/presentation/seller_prfile/ui/seller_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class MainPage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _getPage(controller.selectedIndex.value)),
      bottomNavigationBar: Obx(
        () => StylishBottomBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changePage,
          items: [
            BottomBarItem(
                icon: _buildBottomBarItem(0, SvgPath.icHome),
                title: const Text('Home')),
            BottomBarItem(
                icon: _buildBottomBarItem(1, SvgPath.icMessage),
                title: const Text('Messages')),
            BottomBarItem(
                icon: _buildBottomBarItem(2, SvgPath.icDocument),
                title: const Text('Booking')),
            BottomBarItem(
                icon: _buildBottomBarItem(3, SvgPath.icProfile),
                title: const Text('Profile')),
          ],
          option: AnimatedBarOptions(
            iconStyle: IconStyle.simple,
          ),
        ),
      ),
    );
  }

  Container _buildBottomBarItem(int index, String iconPath) {
    return Container(
      padding: const EdgeInsets.all(6),
      height: 40,
      width: 40,
      decoration:
          controller.selectedIndex.value == index ? _buildDecoration() : null,
      child: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          controller.selectedIndex.value == index
              ? Colors.white
              : Colors.transparent,
          BlendMode.srcATop,
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      gradient: LinearGradient(
        begin: Alignment.topCenter, // Start at the top
        end: Alignment.bottomCenter, // End at the bottom
        colors: [
          Color(0xFF8F2CF2), // CSS #8F2CF2
          Color(0xFF2C67F2) // CSS #2C67F2
        ],
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const DashboardScreen();
      case 1:
        return const MassagePage();
      case 2:
        return const BookingListPage();
      case 3:
        return const SellerProfilePage();
      default:
        return const BookingListPage();
    }
  }
}
