import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/common/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OtpVerify extends StatelessWidget {
  OtpVerify({super.key, required this.email});
  final String email;
  final OtpFieldController controller = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SvgPicture.asset(SvgPath.appLogo),
            gapH50,
            Text(
              'Enter Verification Code',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: twentyFourPx,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            gapH16,
            Text(
              'We have sent you a 4 digit verification code on',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: twelvePx,
                    fontWeight: FontWeight.w400,
                    color: ServiceAppColor.subtitleColor,
                  ),
            ),
            gapH16,
            Text(
              email,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: sixteenPx,
                    fontWeight: FontWeight.w400,
                    color: ServiceAppColor.hintTextColor,
                  ),
            ),
            gapH50,
            OTPTextField(
              length: 4,
              width: 65.percentWidth,
              controller: controller,
              fieldWidth: fiftyPx,
              keyboardType: TextInputType.number,
              otpFieldStyle: OtpFieldStyle(
                borderColor: ServiceAppColor.hintTextColor,
                focusBorderColor: ServiceAppColor.hintTextColor,
              ),
              spaceBetween: 5,
              outlineBorderRadius: twelvePx,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: twentyPx,
                    fontWeight: FontWeight.w500,
                    color: ServiceAppColor.textColor,
                  ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                print("Completed: $pin");
              },
            ),
            gapH50,
            SubmitButton(buttonTitle: 'Verify', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
