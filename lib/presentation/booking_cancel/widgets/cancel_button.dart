import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/booking_cancel/widgets/bottom_sheet_button.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showBottomSheet(context),
      child: Padding(
        padding: padding20,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: fiftyPx,
          decoration: BoxDecoration(
            color: ServiceAppColor.upComingBoxColor,
            borderRadius: radius10,
          ),
          child: const Text(
            'Cancel Now',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              height: 19.09 / 16.0, // Calculate line height based on fontSize
              letterSpacing: 0.02,
            ),
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '😢', // Sad Emoji
                style: TextStyle(fontSize: 50.0),
              ),
              gapH16,
              const Text(
                'Are you sure about cancelling\nthis booking?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: ServiceAppColor.textColor),
              ),
              gapH15,
              const Text(
                'You can always reschedule it.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: ServiceAppColor.textColor),
              ),
              gapH35,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BottomSheetButton(
                    buttonColor: Colors.black,
                    buttonTitle: 'Cancel',
                    onTap: () {},
                  ),
                  gapW12,
                  BottomSheetButton(
                    buttonColor: ServiceAppColor.upComingBoxColor,
                    buttonTitle: 'Reschedule',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
