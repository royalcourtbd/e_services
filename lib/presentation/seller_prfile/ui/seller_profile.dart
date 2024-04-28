import 'package:e_services/core/bindings/base.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellerProfilePage extends StatelessWidget {
  const SellerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Base.authC.getProfile();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              child: Base.authC.profileModel.value!.imageLink != ''
                  ? CircleAvatar(
                      radius: 30,
                      child: Image.network(
                        fit: BoxFit.cover,
                        Base.authC.profileModel.value!.imageLink!,
                        width: hundredPx,
                        height: hundredPx,
                      ),
                    )
                  : Image.asset(
                      SvgPath.imgProfilePic2,
                      width: sixtyPx,
                      height: sixtyPx,
                    ),
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
                Base.authC.profileModel.value!.fullname!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: twentyFourPx,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            gapH25,
            ProfileWidgetRow(
                iconPath: SvgPath.icService,
                title: 'Services',
                onTap: () async {
                  await Base.sellerC.getMyServices();
                }),
            gapH30,
            ProfileWidgetRow(
              iconPath: SvgPath.icTerm,
              title: 'Terms and Conditions',
              onTap: () {},
            ),
            gapH30,
            ProfileWidgetRow(
              iconPath: SvgPath.icLogout2,
              title: 'Log out',
              onTap: () async {
                Base.authC.signOut();
              },
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
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: paddingV10,
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
      ),
    );
  }
}
