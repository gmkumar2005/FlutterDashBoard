import 'package:bloc/bloc.dart';

import '../../constants.dart';

class NavigationCubit extends Cubit<NavbarItem> {
  NavigationCubit() : super(NavbarItem.dashboard);
  void getNavBarItem(NavbarItem navbarItem) {
    emit(navbarItem);
  }
}
