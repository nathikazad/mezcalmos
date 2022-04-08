import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Menu),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColorLight,
          unselectedItemColor: Colors.grey.shade600,
          currentIndex: currentIndex,
          onTap: (int newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.timelapse), label: 'Orders'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_laundry_service), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Info'),
          ]),
    );
  }
  // Widget getCurrentScreen(int index){
  //   switch (index) {
  //     case 0 :
  //     return

  //       break;
  //     default:
  //   }
  // }
}
