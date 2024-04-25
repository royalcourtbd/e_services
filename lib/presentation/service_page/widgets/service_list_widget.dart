import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';

class ServiceListWidget extends StatelessWidget {
  const ServiceListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: paddingV10,
            child: Container(
              padding: padding10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: radius10,
              ),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: radius10,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: radius10,
                      child: Image.asset(
                        SvgPath.img2,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  gapW15,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.yellow),
                            Text(
                              '5.0',
                              style: TextStyle(
                                fontSize: fourteenPx,
                                fontWeight: FontWeight.w400,
                                color: Colors.yellow,
                              ),
                            ),
                            gapW5,
                            Text(
                              '(120)',
                              style: TextStyle(
                                fontSize: fourteenPx,
                                fontWeight: FontWeight.w400,
                                color: ServiceAppColor.subtitleColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, Semper a qusatas commodo aliquam erat orci.',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: twelvePx,
                            fontWeight: FontWeight.w400,
                            color: ServiceAppColor.hintTextColor,
                          ),
                        ),
                        gapH10,
                        Text(
                          '€40.00/h',
                          style: TextStyle(
                            fontSize: fourteenPx,
                            fontWeight: FontWeight.w400,
                            color: ServiceAppColor.ultramarineBlue,
                          ),
                        ),
                        gapH10,
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: fivePx, horizontal: twelvePx),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: radius10,
                            ),
                            child: const Text(
                              'Active',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
