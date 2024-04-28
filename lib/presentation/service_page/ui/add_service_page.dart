import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_services/core/bindings/base.dart';
import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_transition_mixin.dart';

import '../widgets/map_view.dart';

class AddServicePage extends StatefulWidget {
  bool isEdit;
  AddServicePage({super.key, required this.isEdit});

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
                _buildLabelText('Service Type *'),
                gapH10,
                Obx(
                  () => SizedBox(
                    width:
                        Get.width * 0.8, // Set width to 80% of the screen width
                    child: Base.sellerC.categoryList.isEmpty
                        ? DropdownButton<String>(
                            isExpanded: true, // Set to true for full width
                            hint: Text(Base.sellerC.selectedCategory.value),
                            items: <String>['No Item'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              // Base.sellerC.selectedCategory(newValue);
                            },
                          )
                        : DropdownButton<String>(
                            isExpanded: true, // Set to true for full width
                            hint: Text(Base.sellerC.selectedCategory.value),
                            items:
                                Base.sellerC.categoryList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              Base.sellerC.selectedCategory(newValue);
                            },
                          ),
                  ),
                ),
                gapH10,
                _buildLabelText('Service Name *'),
                gapH10,
                CustomTextBox(
                  onchanged: Base.sellerC.serviceName,
                  textEditingController:
                      Base.sellerC.serviceNameController.value,
                ),
                gapH25,
                _buildLabelText('Service Description *'),
                gapH10,
                CustomTextBox(
                  onchanged: Base.sellerC.serviceDescription,
                  maxLines: 5,
                  textEditingController:
                      Base.sellerC.serviceDescriptionController.value,
                ),
                gapH25,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildLabelText(
                        'Price/ ${!Base.sellerC.unit.value ? 'hour' : 'work'} *'),
                    Obx(
                      () => SizedBox(
                        height: 40,
                        width: 100,
                        child: DropdownButton<String>(
                          isExpanded: true, // Set to true for full width
                          hint: Base.sellerC.unit.value
                              ? const Text("Work")
                              : const Text("Hour"),
                          items: <String>['Hour', 'Work'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            newValue == "Work"
                                ? Base.sellerC.unit(true)
                                : Base.sellerC.unit(false);
                          },
                        ),
                      ),
                    )
                  ],
                ),
                gapH10,
                CustomTextBox(
                  textInputType: TextInputType.number,
                  onchanged: Base.sellerC.servicePrice,
                  textEditingController:
                      Base.sellerC.servicePriceController.value,
                ),
                gapH25,
                // _buildLabelText('Image *'),
                GestureDetector(
                  onTap: () async {
                    await Base.sellerC.pickImage();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: radius10,
                      ),
                      child: Center(
                        child: Stack(
                          children: [
                            Base.sellerC.image.value == null
                                ? SizedBox.shrink()
                                : Image.file(Base.sellerC.image.value!),
                            Icon(
                              Icons.add,
                              color: ServiceAppColor.textColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                gapH40,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: Base.sellerC.serviceDescription.value != '' &&
                              Base.sellerC.serviceName.value != '' &&
                              Base.sellerC.servicePrice.value != ''
                          ? () async {
                              widget.isEdit
                                  ? Base.sellerC.editService(
                                      Base.sellerC.selectedId.value)
                                  : Get.to(() => const MapViews());
                            }
                          : () {},
                      child: Container(
                        width: 30.percentWidth,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: tenPx, horizontal: fifteenPx),
                        decoration: BoxDecoration(
                          color: Base.sellerC.serviceDescription.value != '' &&
                                  Base.sellerC.serviceName.value != '' &&
                                  Base.sellerC.servicePrice.value != ''
                              ? ServiceAppColor.upComingBoxColor
                              : Colors.grey,
                          borderRadius: radius8,
                        ),
                        child: Text(
                          widget.isEdit ? "Edit" : 'Submit',
                          style: TextStyle(
                            fontSize: fourteenPx,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
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
  const CustomTextBox(
      {super.key,
      this.maxLines = 1,
      this.textEditingController,
      this.textInputType = TextInputType.text,
      required this.onchanged});

  final int? maxLines;
  final TextEditingController? textEditingController;
  final Function(String?) onchanged;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingH10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius4,
      ),
      child: TextField(
        keyboardType: textInputType,
        onChanged: onchanged,
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
