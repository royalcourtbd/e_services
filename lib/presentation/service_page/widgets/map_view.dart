import 'dart:developer';

import 'package:e_services/core/bindings/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';

class MapViews extends StatefulWidget {
  const MapViews({super.key});

  @override
  State<MapViews> createState() => _MapViewsState();
}

class _MapViewsState extends State<MapViews> {
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
          log(Base.sellerC.selectedLatLng.toString());
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Base.sellerC.saveService();
        },
        child: Icon(Icons.forward),
      ),
      body: FlutterMap(
          mapController: Base.sellerC.mapController,
          options: MapOptions(
            initialCenter:
                Base.sellerC.currentLatLng.value ?? const LatLng(0, 0),
            initialZoom: 15.0,
            onTap: (tapPosition, point) =>
                Base.sellerC.updateMarkerPosition(point),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
            ),
            DragMarkers(markers: _dragMarkers)
          ]),
    );
  }
}
