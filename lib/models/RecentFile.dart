import 'package:flutter/material.dart';
class RecentTransaction {
  final String? icon, title, date, size;

  RecentTransaction({this.icon, this.title, this.date, this.size});
}

List demoRecentTxns = [
  RecentTransaction(
    icon: "assets/icons/cash.svg",
    title: "Payment",
    date: "01-03-2021",
    size: "300",
  ),
  RecentTransaction(
    icon: "assets/icons/cash.svg",
    title: "Payment",
    date: "01-03-2021",
    size: "301",
  ),
  RecentTransaction(
    icon: "assets/icons/flight.svg",
    title: "Booking",
    date: "27-02-2021",
    size: "190",
  ),
  RecentTransaction(
    icon: "assets/icons/laptop5.svg",
    title: "Purchase",
    date: "23-02-2021",
    size: "325",
  ),
  RecentTransaction(
    icon: "assets/icons/pill5.svg",
    title: "Treatment",
    date: "21-02-2021",
    size: "350",
  ),
  RecentTransaction(
    icon: "assets/icons/pill5.svg",
    title: "Treatment",
    date: "23-02-2021",
    size: "250",
  ),
  RecentTransaction(
    icon: "assets/icons/pill5.svg",
    title: "Treatment",
    date: "25-02-2021",
    size: "350",
  ),
  RecentTransaction(
    icon: "assets/icons/pill5.svg",
    title: "Treatment",
    date: "25-02-2021",
    size: "345",
  ),
];
