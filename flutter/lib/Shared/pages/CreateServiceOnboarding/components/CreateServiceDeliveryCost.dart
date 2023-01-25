import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';

class CreateServiceDeliveryCost extends StatefulWidget {
  const CreateServiceDeliveryCost({super.key, required this.viewController});
  final CreateServiceViewController viewController;

  @override
  State<CreateServiceDeliveryCost> createState() =>
      _CreateServiceDeliveryCostState();
}

class _CreateServiceDeliveryCostState extends State<CreateServiceDeliveryCost> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _costComponent(
                      controller: widget.viewController.freeKmRange,
                      suffixTitle: 'Km',
                      title: 'Free Delivery range'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Within this distance, the customer won’t be charged for the delivery.",
                    style: Get.textTheme.bodyText2,
                  ),
                  Divider(
                    height: 35,
                  ),
                ],
              ),
              _costComponent(
                  controller: widget.viewController.minCost,
                  suffixTitle: '\$',
                  title: 'Minimum cost'),
              const SizedBox(
                height: 15,
              ),
              _costComponent(
                  controller: widget.viewController.costPerKm,
                  suffixTitle: '\$/Km',
                  title: 'Cost per km'),
            ],
          ),
        ),
        _previewWidget(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _previewWidget() {
    return Container(
      color: secondaryLightBlueColor,
      margin: EdgeInsets.only(top: 25),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Preview"),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  "Customer distance",
                  style: Get.textTheme.bodyText1,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                  flex: 1,
                  child: TextFormField(
                    onChanged: (String v) {
                      if (v.isEmpty) {
                        widget.viewController.previewCost.value = null;
                      } else if (widget.viewController.canCalculate) {
                        widget.viewController.calculatePreview();
                      }
                    },
                    controller: widget.viewController.distancePreview,
                    textAlignVertical: TextAlignVertical.center,
                    style: Get.textTheme.bodyText1,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                    decoration: InputDecoration(
                        suffixIconConstraints:
                            BoxConstraints.tightFor(width: 50, height: 20),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: Text(
                            "Km",
                            textAlign: TextAlign.right,
                            style: Get.textTheme.bodyText1,
                          ),
                        ),
                        fillColor: Colors.white),
                  ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cost",
                style: Get.textTheme.bodyText1,
              ),
              Obx(
                () => Text(
                  widget.viewController.previewCost.value
                          ?.toPriceString(rounded: false) ??
                      "_",
                  style: Get.textTheme.bodyText1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _costComponent(
      {required String title,
      required String suffixTitle,
      required TextEditingController controller}) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Text(
            title,
            style: Get.textTheme.bodyText1,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
            flex: 1,
            child: TextFormField(
              controller: controller,
              style: Get.textTheme.bodyText1,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ],
              //  textAlign: TextAlign.center,
              decoration: InputDecoration(
                  suffixIconConstraints:
                      BoxConstraints.tightFor(width: 50, height: 20),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: Text(
                      suffixTitle,
                      textAlign: TextAlign.right,
                      style: Get.textTheme.bodyText1,
                    ),
                  ),
                  fillColor: secondaryLightBlueColor),
            ))
      ],
    );
  }
}
