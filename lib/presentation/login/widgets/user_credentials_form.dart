import 'package:e_services/presentation/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/common/submit_button.dart';
import 'package:e_services/presentation/common/text_box.dart';
import 'package:get/get.dart';

import '../../../core/bindings/base.dart';

class UserCredentialsForm extends StatelessWidget {
  UserCredentialsForm({super.key});
  final GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(debugLabel: '_loginFormKey');
  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          TextBox(
            hintText: 'Email/Phone',
            textEditingController: Base.authC.emailController,
            validator: (value) => emailValidation(value!),
            keyboardType: TextInputType.emailAddress,
          ),
          gapH30,
          TextBox(
            hintText: 'Password',
            obscureText: true,
            textEditingController: Base.authC.passwordController,
            validator: (value) => passwordValidation(value!),
            keyboardType: TextInputType.visiblePassword,
          ),
          gapH30,
          InkWell(
            onTap: () {},
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Forgot password?',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: sixteenPx,
                      fontWeight: FontWeight.w400,
                      color: ServiceAppColor.ultramarineBlue,
                    ),
              ),
            ),
          ),
          gapH30,
          SubmitButton(
            buttonTitle: 'Log in',
            onPressed: () => logInButton(),
          ),
        ],
      ),
    );
  }

  emailValidation(String value) {
    if (value.isEmpty) {
      return 'Please Enter Your Email';
    } else if (!GetUtils.isEmail(value)) {
      return 'Please Enter A Valid Email Address';
    }
    return null;
  }

  passwordValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Your Password';
    } else if (value.length <= 7) {
      return 'password should be 8 characters';
    }
    return null;
  }

  void logInButton() async {
    final authC = Get.find<AuthController>();

    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    await authC.signInwithemailpass(
        authC.emailController.text, authC.passwordController.text);
    loginFormKey.currentState!.save();
  }
}
