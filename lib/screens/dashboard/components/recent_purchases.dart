import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            return Center(child: Text("Error ${state.error}"));
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
              (index) => recentPaymentDataRow(purchaseList[index]),
            ),
          ),
        ),
      ],
    ),
  );
}

DataRow recentPaymentDataRow(Purchase purchaseInfo) {
  var purchaseidShort = purchaseInfo.purchaseid!.substring(purchaseInfo.purchaseid!.length - 8);

  return DataRow(
    cells: [
      DataCell(Text(purchaseidShort)),
      DataCell(Text(purchaseInfo.customerid!)),
      DataCell(Text(purchaseInfo.itempurchased!)),
      DataCell(Text(purchaseInfo.price!.toString())),
      DataCell(Text(purchaseInfo.quantity!.toString())),
      DataCell(Text(purchaseInfo.dateofpurchase!.toString())),
    ],
  );
}
