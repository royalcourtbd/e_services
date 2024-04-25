import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/login/widgets/or_seoarator_widget.dart';
import 'package:e_services/presentation/login/widgets/user_credentials_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../common/submit_button.dart';
import '../../signup/ui/sign_up.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: paddingH20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              SvgPath.appLogo,
            ),
            gapH50,
            Text(
              'Log in your account',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: twentyFourPx,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            gapH50,
            UserCredentialsForm(),
            gapH50,
            const OrSeparatorWidget(),
            gapH50,
            SubmitButton(
              buttonTitle: 'Sign Up',
              onPressed: () {
                Get.to(() => SignUpPage());
              },
            )
          ],
        ),
      ),
    );
  }
}
