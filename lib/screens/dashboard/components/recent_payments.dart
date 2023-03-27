import 'package:admin/models/Payment.dart';
import 'package:admin/models/RecentFile.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class RecentPayments extends StatelessWidget {
  const RecentPayments({
    Key? key,
  }) : super(key: key);

  // txnid, accountid, amountpaid, amountrecieved, dataofpayment
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
            "Recent Payments",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("TXNID"),
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
                (index) => recentPaymentDataRow(demoPayments[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentPaymentDataRow(Payment paymentInfo) {
  return DataRow(
    cells: [
      DataCell(Text(paymentInfo.txnid!)),
      DataCell(Text(paymentInfo.accountid!)),
      DataCell(Text(paymentInfo.amountrecieved!)),
      DataCell(Text("(${paymentInfo.amountpaid!})")),
      DataCell(Text(paymentInfo.dataofpayment!)),
    ],
  );
}
