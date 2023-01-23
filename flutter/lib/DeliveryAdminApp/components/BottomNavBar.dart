import 'package:flutter/material.dart';

class DeliveryOpBottomNavBar extends StatelessWidget {
  const DeliveryOpBottomNavBar({required this.tabController, super.key});
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border(
        //   top: BorderSide(
        //     color: Color.fromARGB(255, 199, 199, 199),
        //     width: 1,
        //   ),
        // ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      height: 68,
      child: TabBar(
        indicator: UnderlineTabIndicator(borderSide: BorderSide.none),
        controller: tabController,
        tabs: [
          Tab(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.history,
                      size: 20,
                      color: _getColorBasedOnSelectedTabIndex(0),
                    ),
                    Text(
                      "Orders",
                      style: TextStyle(
                        color: _getColorBasedOnSelectedTabIndex(0),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Tab(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delivery_dining,
                      size: 20,
                      color: _getColorBasedOnSelectedTabIndex(1),
                    ),
                    Text(
                      "Drivers",
                      style: TextStyle(
                        color: _getColorBasedOnSelectedTabIndex(1),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Tab(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.price_check,
                      size: 20,
                      color: _getColorBasedOnSelectedTabIndex(2),
                    ),
                    Text(
                      "Cost",
                      style: TextStyle(
                        color: _getColorBasedOnSelectedTabIndex(2),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Tab(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 20,
                      color: _getColorBasedOnSelectedTabIndex(3),
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: _getColorBasedOnSelectedTabIndex(3),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorBasedOnSelectedTabIndex(int _tabIndex) {
    if (tabController.index == _tabIndex)
      return Color.fromRGBO(103, 121, 254, 1);
    else
      return Color.fromRGBO(196, 196, 196, 1);
  }
}
