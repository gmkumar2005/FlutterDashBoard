import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/app_blocs.dart';
import '../../../blocs/app_events.dart';
import '../../../blocs/app_states.dart';
import '../../../constants.dart';
import '../../../models/Customer.dart';
import '../../../repo/repositories.dart';

class Customers extends StatelessWidget {
  const Customers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomerBloc>(
          create: (BuildContext context) => CustomerBloc(CustomerRepository()),
        ),
      ],
      child: _renderCustomerBlock(),
    );
  }
}

Widget _renderCustomerBlock() {
  return BlocProvider(
      create: (context) => CustomerBloc(
            CustomerRepository(),
          )..add(LoadCustomerEvent()),
      child: BlocBuilder<CustomerBloc, CustomerState>(
        builder: (context, state) {
          if (state is CustomerLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CustomerErrorState) {
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
                  child: _renderTable(context, demoCustomers),
                )
              ])
            ]);
          }
          if (state is CustomerLoadedState) {
            List<Customer> customerList = state.customers;
            return _renderTable(context, customerList);
          }
          return Container();
        },
      ));
}

Widget _renderTable(BuildContext context, List<Customer> customerList) {
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
                label: Text("Customer id"),
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
              customerList.length,
              (index) => customersDataRow(customerList[index]),
            ),
          ),
        ),
      ],
    ),
  );
}

DataRow customersDataRow(Customer customerInfo) {
  return DataRow(
    cells: [
      DataCell(Text(customerInfo.customerid!)),
      DataCell(Text(customerInfo.name!)),
      DataCell(Container(
        child: Text(customerInfo.age!.toString()),
        alignment: Alignment.centerRight,
        width: 50,
      )),
      DataCell(Text(customerInfo.gender!)),
      DataCell(Text(customerInfo.dateofregistration!)),
    ],
  );
}
