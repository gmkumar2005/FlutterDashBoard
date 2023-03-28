import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Patient.dart';

// PatientID. Name. Age. Gender. DateOfAdmission
// Slno. PatientID. Diagnosis. Treatment. DateOfTreatment. Cost

class Patients extends StatelessWidget {
  const Patients({
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
            "Patients",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Patient ID"),
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
                  label: Text("Date of admission"),
                )
              ],
              rows: List.generate(
                demoPatients.length,
                (index) => patientsDataRow(demoPatients[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow patientsDataRow(Patient patientInfo) {
  return DataRow(
    cells: [
      DataCell(Text(patientInfo.patientid!)),
      DataCell(Text(patientInfo.name!)),
      DataCell(Text(patientInfo.age!)),
      DataCell(Text(patientInfo.gender!)),
      DataCell(Text(patientInfo.dateofadmission!)),
    ],
  );
}