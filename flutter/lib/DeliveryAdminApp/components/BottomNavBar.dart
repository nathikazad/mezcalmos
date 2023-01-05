import 'package:flutter/material.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

class DeliveryOpBottomNavBar extends StatelessWidget {
  const DeliveryOpBottomNavBar({super.key});

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.history,
                      size: 20,
                      color: Colors.grey.shade400,
                    ),
                    Text(
                      "Orders",
                      style: TextStyle(
                        color: Colors.grey.shade400,
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
          InkWell(
            onTap: () => MezRouter.toNamed(kCompanyDriversScreen),
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delivery_dining,
                      size: 20,
                      color: Colors.grey.shade400,
                    ),
                    Text(
                      "Drivers",
                      style: TextStyle(
                        color: Colors.grey.shade400,
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
          InkWell(
            onTap: () => MezRouter.toNamed(kDeliveryCostSetter),
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.price_check,
                      size: 20,
                      color: Colors.grey.shade400,
                    ),
                    Text(
                      "Cost",
                      style: TextStyle(
                        color: Colors.grey.shade400,
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
          InkWell(
            onTap: () => MezRouter.toNamed(kServiceProfileScreen),
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.grey.shade400,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.grey.shade400,
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
}
