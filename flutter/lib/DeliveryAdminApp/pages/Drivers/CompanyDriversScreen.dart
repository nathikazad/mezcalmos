import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryAdminAuth.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/graphql/delivery_driver/hsDeliveryDriver.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Utilities/AgentStatus.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class CompanyDriversScreen extends StatefulWidget {
  const CompanyDriversScreen({super.key});

  @override
  State<CompanyDriversScreen> createState() => _CompanyDriversScreenState();
}

class _CompanyDriversScreenState extends State<CompanyDriversScreen> {
  final DeliveryOperatorAuthController _operatorAuthController =
      Get.find<DeliveryOperatorAuthController>();
  RxList<DeliveryDriver> _drivers = <DeliveryDriver>[].obs;

  @override
  void initState() {
    get_drivers_by_service_provider_id(
            serviceProviderId:
                _operatorAuthController.deliveryOperator!.companyId)
        .then((value) {
      mezDbgPrint("[AAA] GOT drivers list === len ===> ${value?.length}");
      if (value != null) _drivers.assignAll(value);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        title: 'Drivers',
        showNotifications: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            InkWell(
              onTap: _showAddDriverBottomSheet,
              child: Container(
                width: Get.width,
                height: 72,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color.fromRGBO(225, 228, 255, 1),
                ),
                child: Center(
                  child: Text(
                    'Add driver',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color.fromRGBO(103, 121, 254, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Your drivers list',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Obx(
              () => SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _drivers.map<Widget>((d) {
                    return _driverCard(d);
                    // Container(
                    //   padding: EdgeInsets.all(5),
                    //   child: Center(child: Text(d.driverInfo.name)),
                    // );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _driverCard(DeliveryDriver driver) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            Image.network(driver.driverInfo.image).image,
                        backgroundColor: Color.fromARGB(255, 203, 203, 203),
                      ),
                      Positioned(
                        right: -30,
                        bottom: 3,
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: primaryBlueColor, shape: BoxShape.circle),
                          child: Icon(
                            Icons.delivery_dining,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          driver.driverInfo.name,
                          style: Get.textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: driver.deliveryDriverState.status ==
                                        AgentStatus.Awaiting_approval
                                    ? Colors.orange
                                    : (driver.deliveryDriverState.isOnline
                                        ? primaryBlueColor
                                        : Colors.grey.shade700),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              driver.deliveryDriverState.status ==
                                      AgentStatus.Awaiting_approval
                                  ? 'Waiting for approval'
                                  : (driver.deliveryDriverState.isOnline
                                      ? 'Available'
                                      : 'Unavailable'),
                              style: Get.textTheme.bodySmall
                                  ?.copyWith(fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  if (driver.deliveryDriverState.status !=
                      AgentStatus.Awaiting_approval)
                    InkWell(
                      onTap: () async {},
                      child: Ink(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          child: Container(
                            // height: 8,
                            // width: 8,
                            child: Center(
                              child: Icon(
                                Icons.delete_outline,
                                size: 20,
                                color: Colors.red,
                              ),
                            ),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(249, 216, 214, 1),
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              ),
              if (driver.deliveryDriverState.status ==
                  AgentStatus.Awaiting_approval) ...[
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: Colors.red,
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Reject',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 14.5),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(103, 121, 254, 1),
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: Colors.transparent,
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Approve',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  void _showAddDriverBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      // elevation: 1,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          height: 350,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34),
              topRight: Radius.circular(34),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Ask your driver to scan this QR code on their phone',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              SizedBox(
                height: 8.23,
              ),
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  // image: DecorationImage()
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10.23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      height: 1,
                      // width: 100,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'OR',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      height: 1,
                      // width: 100,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color.fromRGBO(225, 228, 255, 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.link,
                            color: Color.fromRGBO(103, 121, 254, 1),
                          ),
                          SizedBox(width: 5),
                          Center(
                            child: Text(
                              'Copy link',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Color.fromRGBO(103, 121, 254, 1),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color.fromRGBO(227, 255, 228, 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.whatsapp,
                            color: Color.fromRGBO(33, 145, 37, 1),
                          ),
                          SizedBox(width: 5),
                          Center(
                            child: Text(
                              'Whatsapp',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Color.fromRGBO(33, 145, 37, 1),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
