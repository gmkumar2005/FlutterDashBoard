import 'package:admin/models/Account.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../blocs/app_blocs.dart';
import '../../../blocs/app_events.dart';
import '../../../blocs/app_states.dart';
import '../../../constants.dart';
import '../../../repo/repositories.dart';

class Accounts extends StatelessWidget {
  const Accounts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AccountBloc>(
          create: (BuildContext context) => AccountBloc(AccountRepository()),
        ),
      ],
      child: _renderAccountBlock(),
    );
  }
}

Widget _renderAccountBlock() {
  return BlocProvider(
      create: (context) => AccountBloc(
            AccountRepository(),
          )..add(LoadAccountEvent()),
      child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          if (state is AccountLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AccountErrorState) {
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
                  child: _renderTable(context, demoAccounts),
                )
              ])
            ]);
          }
          if (state is AccountLoadedState) {
            List<Account> accountList = state.accounts;
            return _renderTable(context, accountList);
          }
          return Container();
        },
      ));
}

Widget _renderTable(BuildContext context, List<Account> accountList) {
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
          "Accounts",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          width: double.infinity,
          child: DataTable2(
            columnSpacing: defaultPadding,
            minWidth: 600,
            columns: [
              DataColumn(
                label: Text("Account id"),
              ),
              DataColumn(
                label: Text("Name"),
              ),
              DataColumn(
                label: Text("Gender"),
              ),
              DataColumn(
                label: Text("Age"),
              ),
              DataColumn(
                label: Text("Date of joining"),
              ),
              DataColumn(
                label: Text("Opening balance"),
              ),
            ],
            rows: List.generate(
              accountList.length,
              (index) => accountsDataRow(accountList[index]),
            ),
          ),
        ),
      ],
    ),
  );
}

DataRow accountsDataRow(Account accountInfo) {
  return DataRow(
    cells: [
      DataCell(Text(accountInfo.accountid!)),
      DataCell(Text(accountInfo.name!)),
      DataCell(Text(accountInfo.gender!)),
      DataCell(Container(
        child: Text(accountInfo.age!.toString()),
        alignment: Alignment.centerRight,
        width: 50,
      )),
      DataCell(Text(accountInfo.dateofjoining!.toString())),
      DataCell(Container(
          child: Text(
              NumberFormat.compactCurrency(locale: 'EN-us', symbol: "\$")
                  .format(accountInfo.openiningbalance!)),
          alignment: Alignment.centerRight,
          width: 50)),
    ],
  );
}
