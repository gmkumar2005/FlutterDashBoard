import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../navigation_cubit.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuAppController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          _showHeader(),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),
        ProfileCard()
      ],
    );
  }

  _showHeader() {
    return BlocBuilder<NavigationCubit, NavbarItem>(builder: (context, state) {
      switch (state) {
        case NavbarItem.dashboard:
          return Text(
            "Dashboard",
            style: Theme.of(context).textTheme.titleMedium,
          );
          break;
        case NavbarItem.passengers:
          return Text(
            "Travel",
            style: Theme.of(context).textTheme.titleMedium,
          );
          break;
        case NavbarItem.bookings:
          return Text(
            "Travel",
            style: Theme.of(context).textTheme.titleMedium,
          );
          break;

        case NavbarItem.patients:
          return Text(
            "Health care",
            style: Theme.of(context).textTheme.titleMedium,
          );
          break;

        case NavbarItem.treatments:
          return Text(
            "Health care",
            style: Theme.of(context).textTheme.titleMedium,
          );
          break;

        case NavbarItem.accounts:
          return Text(
            "Banking",
            style: Theme.of(context).textTheme.titleMedium,
          );
          break;

        case NavbarItem.payments:
          return Text(
            "Banking",
            style: Theme.of(context).textTheme.titleMedium,
          );
          break;

        case NavbarItem.customers:
          return Text(
            "Shopping",
            style: Theme.of(context).textTheme.titleMedium,
          );
          break;

        case NavbarItem.purchases:
          return Text(
            "Shopping",
            style: Theme.of(context).textTheme.titleMedium,
          );
          break;

        default:
          return Text(
            "Dashboard",
            style: Theme.of(context).textTheme.titleMedium,
          );
          break;
      }
    });
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("Alexandra"),
            ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
