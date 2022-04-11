import 'package:flutter/material.dart';
import 'package:mezcalmos/LaundryApp/pages/DashboardView/OrdersListView/components/OrderCard.dart';

class LaundryOpOrdersListView extends StatelessWidget {
  const LaundryOpOrdersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scrollbar(
      child: ListView(
        padding: const EdgeInsets.all(26),
        children: <Widget>[
          Text(
            "My Orders",
            style: textTheme.headline3,
          ),
          const SizedBox(height: 18),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 20,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, int index) {
              return OrderCard(
                textTheme: textTheme,
              );
            },
          ),
        ],
      ),
    );
  }
}
