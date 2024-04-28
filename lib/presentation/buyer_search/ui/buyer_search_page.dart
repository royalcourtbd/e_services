import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyerSearchPage extends StatelessWidget {
  const BuyerSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ServiceAppColor.scaffoldBgCOlor,
      body: SafeArea(
        child: Padding(
          padding: padding20,
          child: Column(
            children: [
              gapH30,
              Container(
                padding: padding5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: radius10,
                ),
                child: TextFormField(
                  onTapOutside: (PointerDownEvent event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Here',
                    hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ServiceAppColor.hintTextColor,
                          fontWeight: FontWeight.w400,
                        ),
                    prefixIcon: Padding(
                      padding: padding10,
                      child: SvgPicture.asset(SvgPath.icSearch),
                    ),
                    border: noBorder(),
                    errorBorder: noBorder(),
                    enabledBorder: noBorder(),
                    focusedBorder: noBorder(),
                    disabledBorder: noBorder(),
                    focusedErrorBorder: noBorder(),
                  ),
                ),
              ),
              gapH25,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent search',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: twentyFourPx,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              gapH20,
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: tenPx),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          searchHistory[index],
                          style: TextStyle(
                              fontSize: fourteenPx,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff6B6868)),
                        ),
                        SvgPicture.asset(SvgPath.icArrowRightCorner),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  InputBorder noBorder() {
    return InputBorder.none;
  }
}

List searchHistory = [
  'Painting service',
  'Repairing service',
  'Washing service',
];
