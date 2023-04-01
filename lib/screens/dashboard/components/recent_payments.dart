import 'package:admin/models/Payment.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/app_blocs.dart';
import '../../../blocs/app_events.dart';
import '../../../blocs/app_states.dart';
import '../../../constants.dart';
import '../../../repo/repositories.dart';

class RecentPayments extends StatelessWidget {
  const RecentPayments({
    Key? key,
  }) : super(key: key);

  // txnid, accountid, amountpaid, amountrecieved, dateofpayment
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<PaymentBloc>(
          create: (BuildContext context) =>
              PaymentBloc(PaymentsRepository()),
        ),
      ],
      child: _renderPaymentsBlock(),
    );

  }
}

Widget _renderPaymentsBlock() {
  return BlocProvider(
      create: (context) => PaymentBloc(
        PaymentsRepository(),
      )..add(LoadPaymentEvent()),
      child: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state is PaymentLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PaymentErrorState) {
            return  Center(child:  Text("Error ${state.error}"));
          }
          if (state is PaymentLoadedState) {
            List<Payment> paymentsList = state.payments;
            return  _renderTable(context,paymentsList);
          }
          return Container();
        },
      ));
}

Widget _renderTable(BuildContext context, List<Payment> paymentsList) {
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
          "Recent Payments",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          width: double.infinity,
          child: DataTable2(
            columnSpacing: defaultPadding,
            minWidth: 600,
            columns: [
              DataColumn(
                label: Text("Payment id"),
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
              DataColumn(
                label: Text("Purpose"),
              ),
            ],
            rows: List.generate(
              paymentsList.length,
              (index) => recentPaymentDataRow(paymentsList[index]),
            ),
          ),
        ),
      ],
    ),
  );
}

DataRow recentPaymentDataRow(Payment paymentInfo) {
  var paymentidShort = paymentInfo.paymentid!.substring(paymentInfo.paymentid!.length - 8);
  return DataRow(
    cells: [
      DataCell(Text(paymentidShort)),
      DataCell(Text(paymentInfo.accountid!)),
      DataCell(Text(paymentInfo.amountrecieved!.toString())),
      DataCell(Text("(${paymentInfo.amountpaid!.toString()})")),
      DataCell(Text(paymentInfo.dateofpayment!)),
      DataCell(Text(paymentInfo.purpose!)),
    ],
  );
}
