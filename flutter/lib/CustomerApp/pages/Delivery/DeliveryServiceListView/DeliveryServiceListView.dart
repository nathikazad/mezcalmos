import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/Delivery/DeliveryServiceListView/controllers/DeliveryServiceListViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/router/router.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class DeliveryServiceListView extends StatefulWidget {
  const DeliveryServiceListView({super.key});

  static Future<void> navigate() {
    return MezRouter.toPath(XRouter.deliveryServicesRoute);
  }

  @override
  State<DeliveryServiceListView> createState() => _CustServiceListViewState();
}

class _CustServiceListViewState extends State<DeliveryServiceListView> {
  DeliveryServiceListViewController cServiceController =
      DeliveryServiceListViewController();

  @override
  void initState() {
    super.initState();
    cServiceController.init();
  }

  @override
  void dispose() {
    super.dispose();
    cServiceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> serviceListData =
        cServiceController.deliveryServiceListData;
    final TextTheme txt = Theme.of(context).textTheme;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14.0,
            crossAxisSpacing: 14.0,
            childAspectRatio: 1.2,
          ),
          itemCount: serviceListData.length,
          itemBuilder: (BuildContext context, int index) {
            return MezCard(
              onClick: () {},
              content: Column(
                children: [
                  Image.asset(
                    serviceListData[index]["icon"].toString(),
                    height: 96,
                    width: 96,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      serviceListData[index]["title"].toString(),
                      style: txt.headlineSmall,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
