import 'package:admin/models/Payment.dart';
import 'package:admin/models/RecentFile.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../models/Purchase.dart';

class RecentPurchases extends StatelessWidget {
  const RecentPurchases({
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
            "Recent Purchases",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Purchase ID"),
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
                demoPurchases.length,
                (index) => recentPaymentDataRow(demoPurchases[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentPaymentDataRow(Purchase purchaseInfo) {
  return DataRow(
    cells: [
      DataCell(Text(purchaseInfo.txnid!)),
      DataCell(Text(purchaseInfo.accountid!)),
      DataCell(Text(purchaseInfo.amountrecieved!)),
      DataCell(Text("(${purchaseInfo.amountpaid!})")),
      DataCell(Text(purchaseInfo.dataofpayment!)),
    ],
  );
}
