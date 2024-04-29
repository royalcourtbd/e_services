import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.buttonTitle,
    this.onPressed,
    this.image,
    this.fontSize,
  });

  final String buttonTitle;
  final VoidCallback? onPressed;
  final Widget? image;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: paddingV12,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: radius10,
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              ServiceAppColor.completeBoxColor,
              Color(0xFF2C67F2),
            ],
            stops: [
              -0.2705, // Adjust this value to match the desired gradient position
              1.2049, // Adjust this value to match the desired gradient position
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonTitle,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontSize: fontSize ?? twentyPx,
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.center,
            ),
            if (image != null) ...[
              gapW10,
              image!,
            ]
          ],
        ),
      ),
    );
  }
}
