import 'package:flutter/material.dart';
import 'package:mezcalmos/LaundryApp/pages/DashboardView/InfoView/LaundryOpInfoView.dart';
import 'package:mezcalmos/LaundryApp/pages/DashboardView/OrdersListView/LaundryOpOrdersListView.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Menu),
      body: getCurrentScreen(currentIndex),
      bottomNavigationBar: laundryOpBottomNavBar(context),
    );
  }

// Bottom navbar for laundry op dashboard currently with two tabs orders and info
  Widget laundryOpBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
        selectedLabelStyle: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: Theme.of(context).textTheme.subtitle1,
        selectedItemColor: Theme.of(context).primaryColorLight,
        unselectedItemColor: Colors.grey.shade700,
        currentIndex: currentIndex,
        onTap: (int newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.timelapse), label: 'Orders'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.local_laundry_service), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Info'),
        ]);
  }

// function to switch between tabs and get right view from bottom navbar
  Widget getCurrentScreen(int index) {
    switch (index) {
      case 0:
        return LaundryOpOrdersListView();
      case 1:
        return LaundryOpInfoView();

      default:
        return LaundryOpOrdersListView();
    }
  }
}
