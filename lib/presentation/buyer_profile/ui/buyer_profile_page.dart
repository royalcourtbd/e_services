import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyerProfilePage extends StatelessWidget {
  const BuyerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              SvgPath.imgProfilePic,
              width: sixtyPx,
              height: sixtyPx,
            ),
            SvgPicture.asset(SvgPath.icCross)
          ],
        ),
      ),
      body: Padding(
        padding: padding20,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ashfak Sayem',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: twentyFourPx,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            gapH25,
            ProfileWidgetRow(
              iconPath: SvgPath.icBookList,
              title: 'Booking List',
              onTap: () {},
            ),
            gapH30,
            ProfileWidgetRow(
              iconPath: SvgPath.icQuestion,
              title: 'Questions',
              onTap: () {},
            ),
            gapH30,
            ProfileWidgetRow(
              iconPath: SvgPath.icTerms,
              title: 'Terms and Conditions',
              onTap: () {},
            ),
            gapH30,
            ProfileWidgetRow(
              iconPath: SvgPath.icLogout,
              title: 'Log out',
              onTap: () {},
            ),
            gapH30,
          ],
        ),
      ),
    );
  }
}

class ProfileWidgetRow extends StatelessWidget {
  const ProfileWidgetRow({
    super.key,
    required this.iconPath,
    required this.title,
    this.onTap,
  });

  final String iconPath;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: twentyFourPx,
            height: twentyFourPx,
          ),
          gapW15,
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: fourteenPx,
            ),
          )
        ],
      ),
    );
  }
}
