import 'package:flutter/material.dart';
class RecentFile {
  final String? icon, title, date, size;

  RecentFile({this.icon, this.title, this.date, this.size});
}

List demoRecentFiles = [
  RecentFile(
    icon: "assets/icons/cash.svg",
    title: "Payment",
    date: "01-03-2021",
    size: "300",
  ),
  RecentFile(
    icon: "assets/icons/cash.svg",
    title: "Payment",
    date: "01-03-2021",
    size: "301",
  ),
  RecentFile(
    icon: "assets/icons/flight.svg",
    title: "Booking",
    date: "27-02-2021",
    size: "190",
  ),
  RecentFile(
    icon: "assets/icons/laptop5.svg",
    title: "Purchase",
    date: "23-02-2021",
    size: "325",
  ),
  RecentFile(
    icon: "assets/icons/pill5.svg",
    title: "Treatment",
    date: "21-02-2021",
    size: "350",
  ),
  RecentFile(
    icon: "assets/icons/pill5.svg",
    title: "Treatment",
    date: "23-02-2021",
    size: "250",
  ),
  RecentFile(
    icon: "assets/icons/pill5.svg",
    title: "Treatment",
    date: "25-02-2021",
    size: "350",
  ),
  RecentFile(
    icon: "assets/icons/pill5.svg",
    title: "Treatment",
    date: "25-02-2021",
    size: "345",
  ),
];
