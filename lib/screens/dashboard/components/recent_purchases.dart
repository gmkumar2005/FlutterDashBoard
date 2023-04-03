import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../blocs/app_blocs.dart';
import '../../../blocs/app_events.dart';
import '../../../blocs/app_states.dart';
import '../../../constants.dart';
import '../../../models/Purchase.dart';
import '../../../repo/repositories.dart';

class RecentPurchases extends StatelessWidget {
  const RecentPurchases({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PurchaseBloc>(
          create: (BuildContext context) => PurchaseBloc(PurchaseRepository()),
        ),
      ],
      child: _renderPurchaseBlock(),
    );
  }
}

Widget _renderPurchaseBlock() {
  return BlocProvider(
      create: (context) => PurchaseBloc(
            PurchaseRepository(),
          )..add(LoadPurchaseEvent()),
      child: BlocBuilder<PurchaseBloc, PurchaseState>(
        builder: (context, state) {
          if (state is PurchaseLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PurchaseErrorState) {
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
                Expanded(child: _renderTable(context, demoPurchases))
              ])
            ]);
          }
          if (state is PurchaseLoadedState) {
            List<Purchase> purchaseList = state.purchases;
            return _renderTable(context, purchaseList);
          }
          return Container();
        },
      ));
}

Widget _renderTable(BuildContext context, List<Purchase> purchaseList) {
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
          "Recent Purchases",
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
                label: Text("Purchase id"),
              ),
              DataColumn(
                label: Text("Customer id"),
              ),
              DataColumn(
                label: Text("Item purchased"),
              ),
              DataColumn(
                label: Text("Price"),
              ),
              DataColumn(
                label: Text("Quantity"),
              ),
              DataColumn(
                label: Text("Date of purchase"),
              ),
            ],
            rows: List.generate(
              purchaseList.length,
              (index) => recentPurchaseDataRow(purchaseList[index]),
            ),
          ),
        ),
      ],
    ),
  );
}

DataRow recentPurchaseDataRow(Purchase purchaseInfo) {
  var purchaseidShort =
      purchaseInfo.purchaseid!.characters.takeLast(8).toString();

  return DataRow(
    cells: [
      DataCell(Text(purchaseidShort)),
      DataCell(Text(purchaseInfo.customerid!)),
      DataCell(Text(purchaseInfo.itempurchased!)),
      DataCell(Container(
          child: Text(
              NumberFormat.compactCurrency(locale: 'EN-us', symbol: "\$")
                  .format(purchaseInfo.price!)),
          alignment: Alignment.centerRight,
          width: 50)),
      DataCell(Container(
        child: Text(purchaseInfo.quantity!.toString()),
        alignment: Alignment.centerRight,
        width: 50,
      )),
      DataCell(Text(purchaseInfo.dateofpurchase!.toString())),
    ],
  );
}
