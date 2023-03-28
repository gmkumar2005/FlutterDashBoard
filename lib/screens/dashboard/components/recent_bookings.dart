import 'package:admin/models/Payment.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Booking.dart';

class RecentBookings extends StatelessWidget {
  const RecentBookings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),

      // Slno. PassengerId. OriginCity. DestinationCity. Distance. ModeOfTransport. PricePerKM
      // PassengerId. Name. Age. Gender. DateOfJourney
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Bookings",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Booking ID"),
                ),
                DataColumn(
                  label: Text("Passenger ID"),
                ),
                DataColumn(
                  label: Text("Origin"),
                ),
                DataColumn(
                  label: Text("Destination"),
                ),
                DataColumn(
                  label: Text("Distance"),
                ),
                DataColumn(
                  label: Text("Price"),
                ),
                DataColumn(
                  label: Text("Date of Journey"),
                ),
              ],
              rows: List.generate(
                demoPayments.length,
                (index) => recentBookingDataRow(demoBookings[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//   final String? bookingid, passengerid, origincity, destinationcity, distance, price, dateofjourney;

DataRow recentBookingDataRow(Booking bookingInfo) {
  return DataRow(
    cells: [
      DataCell(Text(bookingInfo.bookingid!)),
      DataCell(Text(bookingInfo.passengerid!)),
      DataCell(Text(bookingInfo.origincity!)),
      DataCell(Text("(${bookingInfo.destinationcity!})")),
      DataCell(Text(bookingInfo.distance!)),
      DataCell(Text(bookingInfo.price!)),
      DataCell(Text(bookingInfo.dateofjourney!)),
    ],
  );
}
