import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Treatment.dart';

// PatientID. Name. Age. Gender. DateOfAdmission
// Slno. PatientID. Diagnosis. Treatment. DateOfTreatment. Cost

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
                  label: Text("Patient ID"),
                ),
                DataColumn(
                  label: Text("Diagnosis"),
                ),
                DataColumn(
                  label: Text("Treatment"),
                ),
                DataColumn(
                  label: Text("Date of treatment"),
                ),
                DataColumn(
                  label: Text("Price"),
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

// Slno. PatientID. Diagnosis. Treatment. DateOfTreatment. Cost

DataRow recentTreatmentDataRow(Treatment treatmentInfo) {
  return DataRow(
    cells: [
      DataCell(Text(treatmentInfo.treatmentid!)),
      DataCell(Text(treatmentInfo.patientid!)),
      DataCell(Text(treatmentInfo.diagnosis!)),
      DataCell(Text(treatmentInfo.treatment!)),
      DataCell(Text(treatmentInfo.dateoftreatment!)),
      DataCell(Text(treatmentInfo.price.toString()!)),
    ],
  );
}
