import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerApp_appbar.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class OrdersListScreen extends StatelessWidget {
  final Item item;
  const OrdersListScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomerAppBar(
        title: "Orders",
        autoBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Ongoing orders',
                      style: txt.bodyText1,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        mezDbgPrint('tapped');
                        getRestaurantOrderRoute(item.id!);
                      },
                      child: Text('Order')),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            FilterOrders(),
            Container(
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class FilterOrders extends StatelessWidget {
  const FilterOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.list, color: Colors.black),
                  SizedBox(
                    width: 10,
                  ),
                  Text('All orders'),
                ],
              ),
              onSelected: (v) {},
              selected: true,
            ),
            SizedBox(
              width: 5,
            ),
            FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Deliverd'),
                ],
              ),
              onSelected: (v) {},
              selected: false,
            ),
            SizedBox(
              width: 5,
            ),
            FilterChip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.cancel, color: Colors.red),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Canceled'),
                  ],
                ),
                onSelected: (v) {}),
          ],
        ),
      ),
    );
  }
}

class OldOrderComponent extends StatelessWidget {
  const OldOrderComponent({
    Key? key,
    required this.item,
    required this.order,
  }) : super(key: key);

  final Item item;
  final bool order;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 35, backgroundImage: NetworkImage(item.image!)),
                SizedBox(width: 10.w),
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Restaurant name',
                        style: txt.subtitle1,
                      ),
                      Text(
                        (order) ? 'Order delivered' : 'Order canceled',
                        style: txt.headline3,
                      ),
                      Text(
                        '12/04/2021 at 08:35 AM',
                        style: txt.bodyText2,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                (order)
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 50,
                      )
                    : Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 50,
                      ),
              ],
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total cost : 50.00",
                  ),
                  Text(
                    'Date :  12/04/2021 at 08:20 AM',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

