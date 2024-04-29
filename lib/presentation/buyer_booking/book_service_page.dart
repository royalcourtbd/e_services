import 'package:e_services/core/bindings/base.dart';
import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/models/my_service_model.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/core/static/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

class BookServicePage extends StatefulWidget {
  BookServicePage({super.key, required this.item});
  MyServiceModel item;

  @override
  State<BookServicePage> createState() => _BookServicePageState();
}

class _BookServicePageState extends State<BookServicePage> {
  late final List<DragMarker> _dragMarkers;
  @override
  void initState() {
    _dragMarkers = [
      DragMarker(
        key: GlobalKey<DragMarkerWidgetState>(),
        point: Base.sellerC.currentLatLng.value!,
        size: const Size.square(75),
        offset: const Offset(0, -20),
        dragOffset: const Offset(0, -35),
        builder: (_, __, isDragging) {
          if (isDragging) {
            return const Icon(
              Icons.edit_location,
              size: 75,
              color: Colors.red,
            );
          }
          return const Icon(
            Icons.location_on,
            size: 50,
            color: Colors.red,
          );
        },
        onDragStart: (details, point) => debugPrint("Start point $point"),
        onDragEnd: (details, point) {
          Base.sellerC.selectedLatLng(point);
        },
        onTap: (point) => debugPrint("on tap"),
        onLongPress: (point) => debugPrint("on long press"),
        scrollMapNearEdge: true,
        scrollNearEdgeRatio: 2.0,
        scrollNearEdgeSpeed: 2.0,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ServiceAppColor.scaffoldBgCOlor,
        appBar: AppBar(
          backgroundColor: ServiceAppColor.scaffoldBgCOlor,
          title: Text(
            ' Book Service',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: twentyPx,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: [SvgPicture.asset(SvgPath.icNotification), gapW20],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.zero,
              child: Container(
                width: Get.width - 50,
                height: 200,
                padding: padding15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(twentyPx),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: radius15,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                    0.15), // Shadow color with opacity
                                blurRadius: 13.9, // Blur radius
                                offset: const Offset(
                                    1, 1), // X, Y offsets from the container
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: radius12,
                            child: Image.network(
                              widget.item.image!,
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        gapW20,
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '€${widget.item.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: twelvePx,
                                    fontWeight: FontWeight.w400,
                                    color: ServiceAppColor.ultramarineBlue,
                                  ),
                            ),
                            gapH6,
                            Text(
                              widget.item.serviceName!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: twelvePx,
                                    fontWeight: FontWeight.w400,
                                    color: ServiceAppColor.hintTextColor,
                                  ),
                            ),
                            gapH6,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 22.percentWidth,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: radius8,
                                    color: widget.item.status != 'Active'
                                        ? ServiceAppColor.cancelBoxColor
                                            .withOpacity(0.1)
                                        : ServiceAppColor.completeBoxColor
                                            .withOpacity(0.1),
                                  ),
                                  child: Text(
                                    widget.item.status!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: fourteenPx,
                                          fontWeight: FontWeight.w400,
                                          color: widget.item.status != 'Active'
                                              ? ServiceAppColor.cancelBoxColor
                                              : ServiceAppColor
                                                  .completeBoxColor,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            gapH10,
                            ElevatedButton(
                                onPressed: () {
                                  Get.dialog(SizedBox(
                                      height: 500,
                                      child: Card(
                                          child: Center(
                                              child: Column(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () async {
                                                final DateTime? picked =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2015, 8),
                                                        lastDate:
                                                            DateTime(2101));
                                                if (picked != null) {
                                                  Base.buyerC
                                                      .selectedDate(picked);
                                                }
                                              },
                                              child: Obx(
                                                () => Text(Base
                                                            .buyerC
                                                            .selectedDate
                                                            .value !=
                                                        null
                                                    ? DateFormat("yyyy-MM-dd")
                                                        .format(Base
                                                            .buyerC
                                                            .selectedDate
                                                            .value!)
                                                    : 'Select Date'),
                                              )),
                                          SizedBox(
                                            height: 200,
                                            child: FlutterMap(
                                                mapController:
                                                    Base.sellerC.mapController,
                                                options: MapOptions(
                                                  initialCenter: Base
                                                          .sellerC
                                                          .currentLatLng
                                                          .value ??
                                                      const LatLng(0, 0),
                                                  initialZoom: 15.0,
                                                  onTap: (tapPosition, point) =>
                                                      Base.sellerC
                                                          .updateMarkerPosition(
                                                              point),
                                                ),
                                                children: [
                                                  TileLayer(
                                                    urlTemplate:
                                                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                                    subdomains: const [
                                                      'a',
                                                      'b',
                                                      'c'
                                                    ],
                                                  ),
                                                  DragMarkers(
                                                      markers: _dragMarkers)
                                                ]),
                                          ),
                                          ElevatedButton(
                                              onPressed: () async {
                                                await Base.buyerC
                                                    .bookService(widget.item);
                                              },
                                              child: const Text('Submit'))
                                        ],
                                      )))));
                                },
                                child: Text('Book Now'))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
