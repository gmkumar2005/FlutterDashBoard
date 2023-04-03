import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/app_blocs.dart';
import '../../../blocs/app_events.dart';
import '../../../blocs/app_states.dart';
import '../../../constants.dart';
import '../../../models/Patient.dart';
import '../../../repo/repositories.dart';

// PatientID. Name. Age. Gender. DateOfAdmission
// Slno. PatientID. Diagnosis. Treatment. DateOfTreatment. Cost

class Patients extends StatelessWidget {
  const Patients({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PatientBloc>(
          create: (BuildContext context) => PatientBloc(PatientRepository()),
        ),
      ],
      child: _renderPassengerBlock(),
    );
  }
}

Widget _renderPassengerBlock() {
  return BlocProvider(
      create: (context) => PatientBloc(
            PatientRepository(),
          )..add(LoadPatientEvent()),
      child: BlocBuilder<PatientBloc, PatientState>(
        builder: (context, state) {
          if (state is PatientLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PatientErrorState) {
            return Column(children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Center(
                    child: Text(
                        "Error occurred while fetching data from the server ${state.error}"))
              ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Center(child: Text("Showing demo data"))]),
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                  child: _renderTable(context, demoPatients),
                )
              ])
            ]);
          }
          if (state is PatientLoadedState) {
            List<Patient> patientList = state.patients;
            return _renderTable(context, patientList);
          }
          return Container();
        },
      ));
}

Widget _renderTable(BuildContext context, List<Patient> patientList) {
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
                label: Text("Patient id"),
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
              patientList.length,
              (index) => patientsDataRow(patientList[index]),
            ),
          ),
        ),
      ],
    ),
  );
}

DataRow patientsDataRow(Patient patientInfo) {
  return DataRow(
    cells: [
      DataCell(Container(
        child: Text(patientInfo.patientid!),
        width: 50,
      )),
      DataCell(Text(patientInfo.name!)),
      DataCell(Container(
        child: Text(patientInfo.age!.toString()),
        alignment: Alignment.centerRight,
        width: 50,
      )),
      DataCell(Text(patientInfo.gender!)),
      DataCell(Text(patientInfo.dateofadmission!)),
    ],
  );
}
