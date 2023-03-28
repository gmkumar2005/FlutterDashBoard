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
                  label: Text("Account"),
                ),

                DataColumn(
                  label: Text("Amount Received"),
                ),

                DataColumn(
                  label: Text("Amount Paid"),
                ),

                DataColumn(
                  label: Text("Date"),
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

DataRow recentBookingDataRow(Booking bookingInfo) {
  return DataRow(
    cells: [
      DataCell(Text(bookingInfo.txnid!)),
      DataCell(Text(bookingInfo.accountid!)),
      DataCell(Text(bookingInfo.amountrecieved!)),
      DataCell(Text("(${bookingInfo.amountpaid!})")),
      DataCell(Text(bookingInfo.dataofpayment!)),
    ],
  );
}
