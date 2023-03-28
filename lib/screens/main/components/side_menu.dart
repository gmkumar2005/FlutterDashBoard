import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../dashboard/navigation_cubit.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: SvgPicture.asset("assets/icons/stone1.svg")),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              log("Clicked Dashboard");
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(NavbarItem.dashboard);
            },
          ),
          DrawerListTile(
            title: "Passengers",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {

              log("Clicked Passengers");
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(NavbarItem.passengers);
            },
          ),
          DrawerListTile(
            title: "Bookings",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              log("Clicked Bookings");
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(NavbarItem.bookings);
            },
          ),
          DrawerListTile(
            title: "Patients",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              log("Clicked Patients");
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(NavbarItem.patients);
            },
          ),
          DrawerListTile(
            title: "Treatments",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              log("Clicked Treatments");
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(NavbarItem.treatments);
            },
          ),
          DrawerListTile(
            title: "Accounts",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              log("Clicked Accounts");
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(NavbarItem.accounts);
            },
          ),
          DrawerListTile(
            title: "Payments",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              log("Clicked Payments");
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(NavbarItem.payments);
            },
          ),
          DrawerListTile(
            title: "Customers",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              log("Clicked Customers");
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(NavbarItem.customers);
            },
          ),
          DrawerListTile(
            title: "Purchases",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              log("Clicked Purchases");
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(NavbarItem.purchases);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
