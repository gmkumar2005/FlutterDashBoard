import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

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

List demoMyFiles = [
  CloudStorageInfo(
    title: "Travel",
    numOfFiles: 1328,
    svgSrc: "assets/icons/flight.svg",
    totalStorage: "190",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Health care",
    numOfFiles: 1328,
    svgSrc: "assets/icons/pill5.svg",
    totalStorage: "29",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Banking",
    numOfFiles: 1328,
    svgSrc: "assets/icons/cash.svg",
    totalStorage: "16",
    color: Color(0xFFFFA4EB),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Shopping",
    numOfFiles: 5328,
    svgSrc: "assets/icons/laptop5.svg",
    totalStorage: "730",
    color: Color(0xFF54DC10),
    percentage: 78,
  ),
];
