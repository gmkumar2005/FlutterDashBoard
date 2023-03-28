import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Customer.dart';

class Customers extends StatelessWidget {
  const Customers({
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
            "Customers",
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
                  label: Text("Customer ID"),
                ),
                DataColumn(
                  label: Text("Name"),
                ),
                DataColumn(
                  label: Text("Age"),
                ),
                DataColumn(
                  label: Text("Gender"),
                ),
                DataColumn(
                  label: Text("Date of registration"),
                )
              ],
              rows: List.generate(
                demoCustomers.length,
                (index) => customersDataRow(demoCustomers[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow customersDataRow(Customer customerInfo) {
  return DataRow(
    cells: [
      DataCell(Text(customerInfo.customerid!)),
      DataCell(Text(customerInfo.name!)),
      DataCell(Text(customerInfo.age!)),
      DataCell(Text(customerInfo.gender!)),
      DataCell(Text(customerInfo.dateofregistration!)),
    ],
  );
}
