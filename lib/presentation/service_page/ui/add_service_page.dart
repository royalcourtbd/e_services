import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';

class AddServicePage extends StatelessWidget {
  const AddServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ServiceAppColor.scaffoldBgCOlor,
      appBar: AppBar(
        backgroundColor: ServiceAppColor.scaffoldBgCOlor,
        title: const Text('Add Service'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: padding20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabelText('Service Name *'),
              gapH10,
              const CustomTextBox(),
              gapH25,
              _buildLabelText('Service Description *'),
              gapH10,
              const CustomTextBox(
                maxLines: 5,
              ),
              gapH25,
              _buildLabelText('Price/h *'),
              gapH10,
              const CustomTextBox(),
              gapH25,
              _buildLabelText('Image *'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 10, top: 10),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: radius10,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: ServiceAppColor.textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              gapH40,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30.percentWidth,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        vertical: tenPx, horizontal: fifteenPx),
                    decoration: BoxDecoration(
                      borderRadius: radius8,
                      border: Border.all(
                        color: ServiceAppColor.upComingBoxColor,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      'Save as draft',
                      style: TextStyle(
                        fontSize: fourteenPx,
                        fontWeight: FontWeight.w400,
                        color: ServiceAppColor.upComingBoxColor,
                      ),
                    ),
                  ),
                  gapW10,
                  Container(
                    width: 30.percentWidth,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        vertical: tenPx, horizontal: fifteenPx),
                    decoration: BoxDecoration(
                      color: ServiceAppColor.upComingBoxColor,
                      borderRadius: radius8,
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: fourteenPx,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              gapH40,
            ],
          ),
        ),
      ),
    );
  }

  Text _buildLabelText(String title) {
    return Text(
      title,
      style: TextStyle(
        color: ServiceAppColor.textColor,
        fontSize: fourteenPx,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({
    super.key,
    this.maxLines = 1,
    this.textEditingController,
  });

  final int? maxLines;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingH10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius4,
      ),
      child: TextField(
        controller: textEditingController,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: ServiceAppColor.textColor,
            fontSize: fourteenPx,
            fontWeight: FontWeight.w400,
          ),
          border: noBorder(),
        ),
      ),
    );
  }

  InputBorder noBorder() {
    return InputBorder.none;
  }
}
