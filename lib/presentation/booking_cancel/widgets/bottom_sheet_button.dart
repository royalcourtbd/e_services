import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    super.key,
    required this.buttonTitle,
    required this.buttonColor,
    this.onTap,
  });

  final String buttonTitle;
  final Color buttonColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding12,
        decoration: BoxDecoration(
          borderRadius: radius6,
          color: buttonColor,
        ),
        child: Text(
          buttonTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            height: 19.09 / 16.0, // Calculate line height based on fontSize
            letterSpacing: 0.02,
          ),
        ),
      ),
    );
  }
}
