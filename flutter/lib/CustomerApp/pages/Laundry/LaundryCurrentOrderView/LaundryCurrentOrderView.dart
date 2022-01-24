import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/components/LocationPicker.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

class LaundryCurrentOrderView extends StatefulWidget {
  const LaundryCurrentOrderView({Key? key}) : super(key: key);

  @override
  State<LaundryCurrentOrderView> createState() =>
      _LaundryCurrentOrderViewState();
}

class _LaundryCurrentOrderViewState extends State<LaundryCurrentOrderView> {
  final LocationPickerController locationPickerController =
      LocationPickerController();
  // final AuthController authController = Get.find<AuthController>();

  LaundryController laundryController = Get.find<LaundryController>();
  LanguageController lang = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomerAppBar(
        autoBack: true,
        title: 'Order',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              //  LaundryOrderStatusCard(order: order),
              SizedBox(
                height: 20,
              ),
              laundryPricingCard(context),
              SizedBox(
                height: 20,
              ),
              orderSummaryCard(context)
            ],
          ),
        ),
      ),
    );
  }

  orderSummaryCard(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "${lang.strings["customer"]["restaurant"]["cart"]["orderSummary"]}",
              style: Theme.of(context).textTheme.headline3,
            ),
            Divider(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${lang.strings["customer"]["restaurant"]["cart"]["orderCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "\$5/KG",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${lang.strings["customer"]["restaurant"]["cart"]["deliveryCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "-",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${lang.strings["customer"]["restaurant"]["cart"]["totalCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "-",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Divider(
              height: 25,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "${lang.strings["customer"]["restaurant"]["cart"]["deliveryLocation"]} :",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.place_rounded,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(child: Text('No location selected', maxLines: 1)),
              ],
            )
          ],
        ),
      ),
    );
  }

  laundryPricingCard(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Laundry Prcing",
              style: Theme.of(context).textTheme.headline3,
            ),
            Divider(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fixed Rate:",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "\$5/KG",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order weight:",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "-",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${lang.strings["customer"]["restaurant"]["cart"]["totalCost"]} :",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "-",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Divider(
              height: 25,
            ),
            Row(
              children: [
                Icon(
                  Icons.help_outline_rounded,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: Text(
                        'Order weight and total cost will be updated once the laundry service receive your order.',
                        maxLines: 3)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
