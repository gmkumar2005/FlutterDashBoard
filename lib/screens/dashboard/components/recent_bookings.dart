import 'package:admin/blocs/app_blocs.dart';
import 'package:admin/blocs/app_events.dart';
import 'package:admin/blocs/app_states.dart';
import 'package:admin/models/Payment.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../../../models/Booking.dart';
import '../../../repo/repositories.dart';

class RecentBookings extends StatelessWidget {
  const RecentBookings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookingBloc>(
          create: (BuildContext context) =>
              BookingBloc(BookingsRepository()),
        ),
      ],
      child: _renderPassengerBlock(),
    );
  }
}

//   final String? bookingid, passengerid, origincity, destinationcity, distance, price, dateofjourney;


Widget _renderPassengerBlock() {
  return BlocProvider(
      create: (context) => BookingBloc(
        BookingsRepository(),
      )..add(LoadBookingEvent()),
      child: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          if (state is BookingLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BookingErrorState) {
            return  Center(child:  Text("Error ${state.error}"));
          }
          if (state is BookingLoadedState) {
            List<Booking> bookingsList = state.bookings;
            return  _renderTable(context,bookingsList);
          }
          return Container();
        },
      ));
}

Widget _renderTable(BuildContext context,List<Booking> bookingsList) {
  return Container(
    padding: EdgeInsets.all(defaultPadding),
    decoration: BoxDecoration(
      color: secondaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),

    // Slno. PassengerId. OriginCity. DestinationCity. Distance. ModeOfTransport. PricePerKM
    // PassengerId. Name. Age. Gender. DateOfJourney
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recent Bookings",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          width: double.infinity,
          child: DataTable2(
            columnSpacing: defaultPadding,
            minWidth: 600,
            columns: [
              DataColumn(
                label: Text("Booking id"),
              ),
              DataColumn(
                label: Text("Passenger id"),
              ),
              DataColumn(
                label: Text("Origin"),
              ),
              DataColumn(
                label: Text("Destination"),
              ),
              DataColumn(
                label: Text("Distance"),
              ),
              DataColumn(
                label: Text("Price"),
              ),
              DataColumn(
                label: Text("Date of Journey"),
              ),
            ],
            rows: List.generate(
              bookingsList.length,
                  (index) => recentBookingDataRow(bookingsList[index]),
            ),
          ),
        ),
      ],
    ),
  );

}
DataRow recentBookingDataRow(Booking bookingInfo) {
  var bookingidShort = bookingInfo.bookingid!.substring(bookingInfo.bookingid!.length - 8);
  return DataRow(
    cells: [
      DataCell(Text(bookingidShort)),
      DataCell(Text(bookingInfo.passengerid!)),
      DataCell(Text(bookingInfo.origincity!)),
      DataCell(Text(bookingInfo.destinationcity!)),
      DataCell(Text(bookingInfo.distance!.toString())),
      DataCell(Text(bookingInfo.price!.toString())),
      DataCell(Text(bookingInfo.dateofjourney!)),
    ],
  );
}
