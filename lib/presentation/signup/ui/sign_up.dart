import 'dart:developer';

import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:e_services/presentation/common/submit_button.dart';
import 'package:e_services/presentation/common/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/bindings/base.dart';
import '../../services/auth_services.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(SvgPath.appLogo),
                // gapH50,
                // const ThirdPartyLoginButtons(
                //     //TODO: SIgn up page and login page should have the same third party login buttons
                //     ),
                // gapH30,
                // const OrSeparatorWidget(),

                gapH20,
                Text(
                  'Create a new account',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: twentyFourPx,
                        fontWeight: FontWeight.w500,
                      ),
                ),

                CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: Base.authC.image.value != null
                        ? FileImage(Base.authC.image.value!)
                        : null,
                    child: GestureDetector(
                      onTap: () async {
                        await Base.authC.pickImage();
                      },
                      child: Base.authC.image.value != null
                          ? Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: Colors.grey[600],
                            )
                          : Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: Colors.grey[600],
                            ),
                    )),
                gapH10,
                Form(
                    key: signUpFormKey,
                    child: Column(
                      children: [
                        TextBox(
                          hintText: 'Full Name',
                          textEditingController: Base.authC.fullName,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        gapH30,
                        TextBox(
                          hintText: 'Enter Email',
                          textEditingController: Base.authC.emailController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) => emailValidation(value!),
                        ),
                        gapH30,
                        TextBox(
                          hintText: 'Password',
                          textEditingController: Base.authC.passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) => passwordValidation(value!),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Radio button 1
                            Row(
                              children: [
                                Radio(
                                  value: true,
                                  groupValue: Base.authC.isCustomer.value,
                                  onChanged: (value) {
                                    Base.authC.isCustomer.value = true;
                                    log(Base.authC.isCustomer.value.toString());
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
                                  groupValue: Base.authC.isCustomer.value,
                                  onChanged: (value) {
                                    Base.authC.isCustomer.value = false;
                                    log(Base.authC.isCustomer.value.toString());
                                  },
                                ),
                                const Text('Seller'),
                              ],
                            ),
                          ],
                        ),
                        SubmitButton(
                          buttonTitle: 'Sign Up',
                          onPressed: () => signInButton(),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
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

  void signInButton() async {
    final authC = Get.find<AuthController>();

    final isValid = signUpFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    await authC.signUpwithemailpass(authC.emailController.text,
        authC.passwordController.text, authC.isCustomer.value);
  }
}
