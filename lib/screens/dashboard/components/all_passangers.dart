import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Passenger.dart';

class Passengers extends StatelessWidget {
  const Passengers({
    Key? key,
  }) : super(key: key);

  // Slno. PassengerId. OriginCity. DestinationCity. Distance. ModeOfTransport. PricePerKM
  // PassengerId. Name. Age. Gender. DateOfJourney

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
            "Passengers",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Passenger ID"),
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
                  label: Text("Date of birth"),
                )
              ],
              rows: List.generate(
                demoPassengers.length,
                (index) => passengersDataRow(demoPassengers[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow passengersDataRow(Passenger passengerInfo) {
  return DataRow(
    cells: [
      DataCell(Text(passengerInfo.passengerid!)),
      DataCell(Text(passengerInfo.name!)),
      DataCell(Text(passengerInfo.age!)),
      DataCell(Text(passengerInfo.gender!)),
      DataCell(Text(passengerInfo.dateofbirth!))
    ],
  );
}
