import 'package:e_services/presentation/booking/ui/booking_list_page.dart';
import 'package:e_services/presentation/booking_cancel/ui/cancel_booking_page.dart';
import 'package:e_services/presentation/booking_cancel/ui/view_cancel_page.dart';
import 'package:e_services/presentation/dashboard/ui/dashboard_screen.dart';
import 'package:e_services/presentation/main/presenter/main_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _getPage(controller.selectedIndex.value)),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return DashboardScreen();
      case 1:
        return const BookingListPage();
      case 2:
        return const CancelBookingPage();
      case 3:
        return const ViewCancelledPage();
      default:
        return const BookingListPage();
    }
  }
}
