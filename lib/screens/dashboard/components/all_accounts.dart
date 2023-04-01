import 'package:admin/models/Account.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Accounts extends StatelessWidget {
  const Accounts({
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
            "Accounts",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Account id"),
                ),
                DataColumn(
                  label: Text("Name"),
                ),
                DataColumn(
                  label: Text("Gender"),
                ),
                DataColumn(
                  label: Text("Age"),
                ),
                DataColumn(
                  label: Text("DOJ"),
                ),
                DataColumn(
                  label: Text("Opening Balance"),
                ),
              ],
              rows: List.generate(
                demoAccounts.length,
                (index) => accountsDataRow(demoAccounts[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow accountsDataRow(Account accountInfo) {
  return DataRow(
    cells: [
      DataCell(Text(accountInfo.accountid!)),
      DataCell(Text(accountInfo.name!)),
      DataCell(Text(accountInfo.gender!)),
      DataCell(Text(accountInfo.age!)),
      DataCell(Text(accountInfo.dateofjoining!)),
      DataCell(Text(accountInfo.openiningbalance!)),
    ],
  );
}
