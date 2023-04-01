import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/app_blocs.dart';
import '../../../blocs/app_events.dart';
import '../../../blocs/app_states.dart';
import '../../../constants.dart';
import '../../../models/Treatment.dart';
import '../../../repo/repositories.dart';

// PatientID. Name. Age. Gender. DateOfAdmission
// Slno. PatientID. Diagnosis. Treatment. DateOfTreatment. Cost

class RecentTreatments extends StatelessWidget {
  const RecentTreatments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TreatmentBloc>(
          create: (BuildContext context) =>
              TreatmentBloc(TreatmentRepository()),
        ),
      ],
      child: _renderTreatmentBlock(),
    );
  }
}

Widget _renderTreatmentBlock() {
  return BlocProvider(
      create: (context) => TreatmentBloc(
            TreatmentRepository(),
          )..add(LoadTreatmentEvent()),
      child: BlocBuilder<TreatmentBloc, TreatmentState>(
        builder: (context, state) {
          if (state is TreatmentLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TreatmentErrorState) {
            return Center(child: Text("Error ${state.error}"));
          }
          if (state is TreatmentLoadedState) {
            List<Treatment> treatmentsList = state.treatments;
            return _renderTable(context, treatmentsList);
          }
          return Container();
        },
      ));
}

// Slno. PatientID. Diagnosis. Treatment. DateOfTreatment. Cost
Widget _renderTable(BuildContext context, List<Treatment> treatmentsList) {
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
                label: Text("Treatment id"),
              ),
              DataColumn(
                label: Text("Patient id"),
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
              treatmentsList.length,
              (index) => recentTreatmentDataRow(treatmentsList[index]),
            ),
          ),
        ),
      ],
    ),
  );
}

DataRow recentTreatmentDataRow(Treatment treatmentInfo) {
  var treatmentidShort = treatmentInfo.treatmentid!
      .substring(treatmentInfo.treatmentid!.length - 8);
  return DataRow(
    cells: [
      DataCell(Text(treatmentidShort)),
      DataCell(Text(treatmentInfo.patientid!)),
      DataCell(Text(treatmentInfo.diagnosis!)),
      DataCell(Text(treatmentInfo.treatment!)),
      DataCell(Text(treatmentInfo.dateoftreatment!)),
      DataCell(Text(treatmentInfo.price.toString())),
    ],
  );
}
