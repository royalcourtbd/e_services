import 'package:flutter/material.dart';

class MyBookingModel {
  final String serviceName;
  final String dateAndTime;
  final String employeeName;
  final String? customerName;
  final double price;
  final String status;
  final String image;
  final Color color;

  MyBookingModel({
    required this.serviceName,
    required this.dateAndTime,
    required this.employeeName,
    this.customerName,
    required this.price,
    required this.status,
    required this.image,
    required this.color,
  });
}
