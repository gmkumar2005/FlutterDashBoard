import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

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
              // CustomerId. Name. Age. Gender. DateOfPurchase
              // Slno. CustomerId. ItemPurchased. Price. Quantity.
              columns: [
                DataColumn(
                  label: Text("Purchase ID"),
                ),
                DataColumn(
                  label: Text("Customer ID"),
                ),
                DataColumn(
                  label: Text("Item purchased"),
                ),
                DataColumn(
                  label: Text("Price"),
                ),
                DataColumn(
                  label: Text("Quantity"),
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
      DataCell(Text(purchaseInfo.purchaseid!)),
      DataCell(Text(purchaseInfo.customerid!)),
      DataCell(Text(purchaseInfo.itempurchased!)),
      DataCell(Text(purchaseInfo.price!.toString())),
      DataCell(Text(purchaseInfo.quantity!.toString())),
    ],
  );
}
