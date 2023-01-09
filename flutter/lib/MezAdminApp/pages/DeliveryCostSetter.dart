import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class DeliveryCostSetter extends StatefulWidget {
  const DeliveryCostSetter({super.key});

  @override
  State<DeliveryCostSetter> createState() => _DeliveryCostSetterState();
}

class _DeliveryCostSetterState extends State<DeliveryCostSetter> {
  TextEditingController _minCostController = TextEditingController();
  TextEditingController _costPerKmCostController = TextEditingController();
  bool _clickedSaveBtn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Back,
        autoBack: true,
        title: 'Delivery cost',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Column(
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'Minimum cost',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Flexible(
                          child: TextField(
                            controller: _minCostController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                fillColor: Color.fromRGBO(236, 238, 255, 1),
                                hintText: '\$',
                                prefixText: '\$',
                                prefixStyle: TextStyle(color: Colors.black)),

                            // textDirection: TextDirection.rtl,
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'Cost per kilometer',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Flexible(
                          child: TextField(
                            controller: _costPerKmCostController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Color.fromRGBO(236, 238, 255, 1),
                              hintText: '\$/Km',
                              prefixText: '\$/Km',
                              prefixStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),

                            // textDirection: TextDirection.rtl,
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 37),
                  Container(
                    width: Get.width,
                    child: Card(
                      color: Color.fromRGBO(236, 238, 255, 1),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Preview',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontSize: 22,
                                  ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Customer distance',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Flexible(
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      suffixText: 'Km',
                                      suffixStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      prefixStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),

                                    // textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.end,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Cost',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    '-',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: !_clickedSaveBtn
                  ? () async {
                      final num? _minCost =
                          num.tryParse(_minCostController.text);
                      final num? _costPerKm = num.tryParse(
                        _costPerKmCostController.text,
                      );
                      setState(() {
                        _clickedSaveBtn = true;
                      });
                      await Get.find<DeliveryAuthController>().setDeliveryCosts(
                        minCost: _minCost,
                        costPerKm: _costPerKm,
                      );
                      setState(() {
                        _clickedSaveBtn = false;
                      });
                    }
                  : null,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: Get.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: !_clickedSaveBtn
                          ? primaryBlueColor
                          : Colors.grey.shade400,
                    ),
                    child: Text(
                      'Save',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
