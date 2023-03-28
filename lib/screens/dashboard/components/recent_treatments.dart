import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Treatment.dart';

class RecentTreatments extends StatelessWidget {
  const RecentTreatments({
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
            "Recent Treatments",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Treatment ID"),
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
                demoTreatments.length,
                (index) => recentTreatmentDataRow(demoTreatments[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentTreatmentDataRow(Treatment treatmentInfo) {
  return DataRow(
    cells: [
      DataCell(Text(treatmentInfo.txnid!)),
      DataCell(Text(treatmentInfo.accountid!)),
      DataCell(Text(treatmentInfo.amountrecieved!)),
      DataCell(Text("(${treatmentInfo.amountpaid!})")),
      DataCell(Text(treatmentInfo.dataofpayment!)),
    ],
  );
}
