import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/common/submit_button.dart';
import 'package:e_services/presentation/common/text_box.dart';
import 'package:e_services/presentation/login/widgets/or_seoarator_widget.dart';
import 'package:e_services/presentation/login/widgets/third_party_login_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> signUpFormKey =
      GlobalKey<FormState>(debugLabel: '_signUpFormKey');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SvgPicture.asset(SvgPath.appLogo),
            gapH50,
            const ThirdPartyLoginButtons(
                //TODO: SIgn up page and login page should have the same third party login buttons
                ),
            gapH30,
            const OrSeparatorWidget(),
            gapH50,
            Text(
              'Create a new account',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: twentyFourPx,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            gapH50,
            Form(
                key: signUpFormKey,
                child: Column(
                  children: [
                    TextBox(
                      hintText: 'Phone Number',
                      textEditingController: _numberController,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    gapH30,
                    TextBox(
                      hintText: 'Password',
                      textEditingController: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    gapH30,
                    SubmitButton(
                      buttonTitle: 'Sign Up',
                      onPressed: () {},
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
