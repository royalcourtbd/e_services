import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/common/submit_button.dart';
import 'package:e_services/presentation/common/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendOtp extends StatelessWidget {
  SendOtp({super.key});
  final TextEditingController emailTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: padding20,
        child: Column(
          children: [
            SvgPicture.asset(SvgPath.appLogo),
            gapH50,
            gapH50,
            Text(
              'Send OTP',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: twentyFourPx,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            gapH30,
            TextBox(
                hintText: 'Email',
                textEditingController: emailTextEditingController),
            gapH30,
            SubmitButton(buttonTitle: 'Continue', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
