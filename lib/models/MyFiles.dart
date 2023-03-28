import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Booking.dart';
import 'Payment.dart';
import 'Purchase.dart';
import 'Treatment.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

// var sum = numbers.reduce((v, e) => v + e);
// var sum = products.map((product) => product.price).reduce((v, e) => v + e);

List demoMyFiles = [
  CloudStorageInfo(
    title: "Travel",
    numOfFiles: demoBookings.length,
    svgSrc: "assets/icons/flight.svg",
    totalStorage: NumberFormat.compactCurrency(locale: 'EN-us',symbol: "\$").format(totalBookings),
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Health care",
    numOfFiles: demoTreatments.length,
    svgSrc: "assets/icons/pill5.svg",
    totalStorage: NumberFormat.compactCurrency(locale: 'EN-us',symbol: "\$").format(totalTreatmentCost),
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Banking",
    numOfFiles: demoPayments.length,
    svgSrc: "assets/icons/cash.svg",
    totalStorage: NumberFormat.compactCurrency(locale: 'EN-us',symbol: "\$").format(totalBalance),
    color: Color(0xFFFFA4EB),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Shopping",
    numOfFiles: demoPurchases.length,
    svgSrc: "assets/icons/laptop5.svg",
    totalStorage:
    NumberFormat.compactCurrency(locale: 'EN-us',symbol: "\$").format(totalPurchases),
    color: Color(0xFF54DC10),
    percentage: 78,
  ),
];
