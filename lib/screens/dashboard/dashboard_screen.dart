import 'dart:developer';

import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/all_accounts.dart';
import 'package:admin/screens/dashboard/components/all_customers.dart';
import 'package:admin/screens/dashboard/components/all_passangers.dart';
import 'package:admin/screens/dashboard/components/all_patients.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/screens/dashboard/components/recent_bookings.dart';
import 'package:admin/screens/dashboard/components/recent_purchases.dart';
import 'package:admin/screens/dashboard/components/recent_treatments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import 'components/header.dart';
import 'components/recent_payments.dart';
import 'components/recent_transactions.dart';
import 'components/storage_details.dart';
import 'navigation_cubit.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyPortfolio(),
                      SizedBox(height: defaultPadding),
                      _getGridScreen(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) SnapshotDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                _showSnapShot(),
              ],
            )
          ],
        ),
      ),
    );
  }


  _showSnapShot() {
    return BlocBuilder<NavigationCubit, NavbarItem>(builder: (context, state) {
      log("Received Navbar state $state ");
      switch (state) {
        case NavbarItem.dashboard:
        // On Mobile means if the screen is less than 850 we dont want to show it
          if (!Responsive.isMobile(context))
            return Expanded(
              flex: 2,
              child: SnapshotDetails(),
            );
          else
            return Container();
        default:
          return Container();
      }
    });
  }

  // dashboard, passengers, bookings, patients, treatments, accounts, payments, customers, purchases
  _getGridScreen() {
    return BlocBuilder<NavigationCubit, NavbarItem>(builder: (context, state) {
      log("Received Navbar state $state ");
      switch (state) {
        case NavbarItem.dashboard:
          return RecentTransactions();
        case NavbarItem.passengers:
          return Passengers();
        case NavbarItem.bookings:
          return RecentBookings();

        case NavbarItem.patients:
          return Patients();

        case NavbarItem.treatments:
          return RecentTreatments();

        case NavbarItem.accounts:
          return Accounts();

        case NavbarItem.payments:
          return RecentPayments();

        case NavbarItem.customers:
          return Customers();

        case NavbarItem.purchases:
          return RecentPurchases();

        default:
          return RecentTransactions();
      }
    });
  }
}
