import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.textEditingController,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.bgColor,
    this.border,
    this.isSearch = false,
  });
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final Color? bgColor;
  final bool? isSearch;
  final BoxBorder? border;

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: twentyPx),
      decoration: BoxDecoration(
        color: bgColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(tenPx),
        border: border ?? Border.all(color: ServiceAppColor.hintTextColor),
      ),
      child: TextFormField(
        validator: validator,
        controller: textEditingController,
        onSaved: onSaved,
        keyboardType: keyboardType,
        onTapOutside: (PointerDownEvent event) {
          FocusScope.of(context).unfocus();
        },
        obscureText: obscureText,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: ServiceAppColor.hintTextColor,
              fontWeight: FontWeight.w500,
              fontSize: twentyPx,
            ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: ServiceAppColor.hintTextColor,
                fontWeight: FontWeight.w500,
              ),
          prefixIcon: isSearch!
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    SvgPath.icSearch,
                    color: ServiceAppColor.hintTextColor,
                  ),
                )
              : null,
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
