import 'package:admin/blocs/app_blocs.dart';
import 'package:admin/blocs/app_states.dart';
import 'package:admin/repo/repositories.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/app_events.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<PassengerBloc>(
          create: (BuildContext context) =>
              PassengerBloc(PassengerRepository()),
        ),
      ],
      child: _renderPassengerBlock(),
    );
  }
}

Widget _renderPassengerBlock() {
  return BlocProvider(
      create: (context) => PassengerBloc(
            PassengerRepository(),
          )..add(LoadPassengerEvent()),
      child: BlocBuilder<PassengerBloc, PassengerState>(
        builder: (context, state) {
          if (state is PassengerLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PassengerErrorState) {
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
                  child: _renderTable(context, demoPassengers),
                )
              ])
            ]);
          }
          if (state is PassengerLoadedState) {
            List<Passenger> passengerList = state.passengers;
            return _renderTable(context, passengerList);
          }
          return Container();
        },
      ));
}

Widget _renderTable(BuildContext context, List<Passenger> passengerList) {
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
                label: Text("Passenger id"),
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
              passengerList.length,
              (index) => passengersDataRow(passengerList[index]),
            ),
          ),
        ),
      ],
    ),
  );
}

DataRow passengersDataRow(Passenger passengerInfo) {
  return DataRow(
    cells: [
      DataCell(Container(width: 50, child: Text(passengerInfo.passengerid!))),
      DataCell(Container(child: Text(passengerInfo.name!), width: 200)),
      DataCell(Container(
          child: Text(passengerInfo.age!.toString()),
          width: 50,
          alignment: Alignment.centerRight)),
      DataCell(Text(passengerInfo.gender!)),
      DataCell(Text(passengerInfo.dateofbirth!))
    ],
  );
}
