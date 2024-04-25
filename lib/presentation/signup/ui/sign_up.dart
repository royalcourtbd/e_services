import 'dart:developer';

import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/common/submit_button.dart';
import 'package:e_services/presentation/common/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../services/auth_services.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final authC = Get.find<AuthController>();
  final GlobalKey<FormState> signUpFormKey =
      GlobalKey<FormState>(debugLabel: '_signUpFormKey');
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SvgPicture.asset(SvgPath.appLogo),
              // gapH50,
              // const ThirdPartyLoginButtons(
              //     //TODO: SIgn up page and login page should have the same third party login buttons
              //     ),
              // gapH30,
              // const OrSeparatorWidget(),
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
                        hintText: 'Enter Email',
                        textEditingController: authC.emailController,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      gapH30,
                      TextBox(
                        hintText: 'Password',
                        textEditingController: authC.passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Radio button 1
                          Row(
                            children: [
                              Radio(
                                value: true,
                                groupValue: authC.isCustomer.value,
                                onChanged: (value) {
                                  authC.isCustomer.value = true;
                                  log(authC.isCustomer.value.toString());
                                },
                              ),
                              const Text('Customer'),
                            ],
                          ),
                          // Radio button 2
                          Row(
                            children: [
                              Radio(
                                value: false,
                                groupValue: authC.isCustomer.value,
                                onChanged: (value) {
                                  authC.isCustomer.value = false;
                                  log(authC.isCustomer.value.toString());
                                },
                              ),
                              const Text('Seller'),
                            ],
                          ),
                        ],
                      ),
                      SubmitButton(
                        buttonTitle: 'Sign Up',
                        onPressed: () async {
                          await authC.signUpwithemailpass(
                              authC.emailController.text,
                              authC.passwordController.text,
                              authC.isCustomer.value);
                        },
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
