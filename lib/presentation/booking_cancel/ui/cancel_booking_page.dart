import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/font_family.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/booking_cancel/widgets/cancel_button.dart';
import 'package:e_services/presentation/booking_cancel/widgets/show_service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CancelBokingPage extends StatefulWidget {
  const CancelBokingPage({super.key});

  @override
  State<CancelBokingPage> createState() => _CancelBokingPageState();
}

class _CancelBokingPageState extends State<CancelBokingPage> {
  int _selectedReasonIndex = 0;
  String comment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: padding14,
              decoration: BoxDecoration(
                  color: const Color(0xffF3F3F3), borderRadius: radius15),
              child: SvgPicture.asset(
                SvgPath.icLeftArrow,
              ),
            ),
            const Text(
              'Cancel Booking',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                height: 21.78 / 18.0, // Calculate line height based on fontSize
              ),
            ),
            gapW10,
            const SizedBox.shrink()
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShowServiceCard(),
            Container(
              width: double.infinity,
              padding: padding12,
              decoration: const BoxDecoration(
                color: Color(0xffF3F3F3),
              ),
              child: Text(
                'Reason for cancellation',
                style: TextStyle(
                    fontSize: twelvePx,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff6B6868)),
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: reasons.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile<int>(
                  value: index,
                  groupValue: _selectedReasonIndex,
                  onChanged: (value) {
                    setState(() {
                      _selectedReasonIndex = value!;
                    });
                  },
                  title: Text(
                    reasons[index],
                    style: TextStyle(
                      color: ServiceAppColor.textColor,
                      fontSize: fourteenPx,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.inter,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: padding20,
              child: Container(
                padding: padding20,
                decoration: BoxDecoration(
                  color: const Color(
                      0xffF5F5F5), // Change the background color here
                  borderRadius:
                      BorderRadius.circular(8.0), // Add border radius if needed
                ),
                child: TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Describe a problem / comment',
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: fourteenPx,
                      fontWeight: FontWeight.w400,

                      color: ServiceAppColor
                          .hintTextColor, // Change the color as per your requirement
                    ),
                    border: InputBorder.none, // Remove the border
                  ),
                  onChanged: (value) {
                    setState(() {
                      comment = value;
                    });
                  },
                ),
              ),
            ),
            gapH16,
            const CancelButton()
          ],
        ),
      ),
    );
  }
}

List<String> reasons = [
  'A reason here for cancellation of booking',
  'A reason here for cancellation of booking, a reason here for cancellation of booking',
  'A reason here for cancellation of booking',
];
