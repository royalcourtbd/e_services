import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThirdPartyLoginButtons extends StatelessWidget {
  const ThirdPartyLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(SvgPath.googleLogo),
        gapW25,
        SvgPicture.asset(SvgPath.facebookLogo),
      ],
    );
  }
}
