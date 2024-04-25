import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';

class OrSeparatorWidget extends StatelessWidget {
  const OrSeparatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildLineDivider(30.percentWidth),
        gapW25,
        Text(
          'or',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: twentyPx,
                fontWeight: FontWeight.w500,
              ),
        ),
        gapW25,
        buildLineDivider(30.percentWidth),
      ],
    );
  }

  Container buildLineDivider(double width) {
    return Container(
      height: 1,
      width: width,
      color: Colors.black,
    );
  }
}
