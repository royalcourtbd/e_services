import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.textEditingController,
    this.validator,
    this.onSaved,
  });
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: twentyPx),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(tenPx),
        border: Border.all(color: ServiceAppColor.hintTextColor),
      ),
      child: TextFormField(
        validator: validator,
        controller: textEditingController,
        onSaved: onSaved,
        onTapOutside: (PointerDownEvent event) {
          FocusScope.of(context).unfocus();
        },
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: ServiceAppColor.hintTextColor,
                fontWeight: FontWeight.w500,
              ),
          border: noBorder(),
          errorBorder: noBorder(),
          enabledBorder: noBorder(),
          focusedBorder: noBorder(),
          disabledBorder: noBorder(),
          focusedErrorBorder: noBorder(),
        ),
      ),
    );
  }

  InputBorder noBorder() {
    return InputBorder.none;
  }
}
