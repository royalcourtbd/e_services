import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_services/core/bindings/base.dart';
import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

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
                          items: Base.sellerC.categoryList.map((String value) {
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
                textEditingController: Base.sellerC.serviceNameController,
              ),
              gapH25,
              _buildLabelText('Service Description *'),
              gapH10,
              CustomTextBox(
                maxLines: 5,
                textEditingController:
                    Base.sellerC.serviceDescriptionController,
              ),
              gapH25,
              _buildLabelText('Price/h *'),
              gapH10,
              CustomTextBox(
                textEditingController: Base.sellerC.servicePriceController,
              ),
              gapH25,
              // _buildLabelText('Image *'),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: List.generate(
              //       3,
              //       (index) => Padding(
              //         padding: const EdgeInsets.only(right: 10, top: 10),
              //         child: Container(
              //           height: 150,
              //           width: 150,
              //           decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: radius10,
              //           ),
              //           child: const Center(
              //             child: Icon(
              //               Icons.add,
              //               color: ServiceAppColor.textColor,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              // gapH40,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      Get.dialog(SizedBox(
                          height: 500,
                          child: FlutterMap(
                              mapController: Base.sellerC.mapController,
                              options: MapOptions(
                                initialCenter:
                                    Base.sellerC.currentLatLng.value ??
                                        const LatLng(0, 0),
                                initialZoom: 13.0,
                                onTap: Base.sellerC.updateMarkerPosition(),
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                  subdomains: ['a', 'b', 'c'],
                                ),
                                MarkerLayer(markers: [
                                  Marker(
                                    width: 40.0,
                                    height: 40.0,
                                    point: LatLng(_markerLatitude ?? 0,
                                        _markerLongitude ?? 0),
                                    child: const Icon(
                                      Icons.location_pin,
                                      color: Colors.red,
                                    ),
                                  ),
                                ])
                              ])));
                    },
                    child: Container(
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
