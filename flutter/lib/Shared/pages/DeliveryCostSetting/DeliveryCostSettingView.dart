import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/pages/DeliveryCostSetting/controllers/DeliveryCostSettingViewController.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpEditInfoView']['ROpEditInfoView'];

class DeliveryCostSettingView extends StatefulWidget {
  const DeliveryCostSettingView({
    Key? key,
    this.deliveryDetailsId,
  }) : super(key: key);
  final int? deliveryDetailsId;

  @override
  State<DeliveryCostSettingView> createState() =>
      _DeliveryCostSettingViewState();
}

class _DeliveryCostSettingViewState extends State<DeliveryCostSettingView> {
  DeliveryCostSettingViewController viewController =
      DeliveryCostSettingViewController();
  int? deliveryDetailsId;

  @override
  void initState() {
    deliveryDetailsId = widget.deliveryDetailsId ??
        int.tryParse(Get.parameters["deliveryDetailsId"]!);

    // provide service provider id and service Provider type
    if (deliveryDetailsId != null) {
      viewController.init(deliveryDetailsId: deliveryDetailsId!);
    }

    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  bool get asTab => widget.deliveryDetailsId != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(
          asTab ? AppBarLeftButtonType.Menu : AppBarLeftButtonType.Back,
          onClick: asTab ? null : MezRouter.back,
          title: "Delivery Costs"),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      bottomSheet: asTab
          ? null
          : MezButton(
              label: 'Save',
              borderRadius: 0,
              withGradient: true,
              height: 70,
              onClick: () async {
                await viewController.saveDeliveryCost().then((bool? value) {
                  if (value == true) {
                    return Get.snackbar(
                        'Saved', 'Delivery cost have been saved',
                        backgroundColor: Colors.black,
                        colorText: Colors.white,
                        shouldIconPulse: false,
                        icon: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ));
                  }
                });
              },
            ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _costComponent(
                      controller: viewController.minCost,
                      suffixTitle: '\$',
                      title: 'Minimum cost'),
                  const SizedBox(
                    height: 15,
                  ),
                  _costComponent(
                      controller: viewController.costPerKm,
                      suffixTitle: '\$/Km',
                      title: 'Cost per km'),
                ],
              ),
            ),
            _previewWidget(),
            if (asTab)
              Container(
                margin: const EdgeInsets.all(18),
                child: MezButton(
                  label: 'Save',
                  borderRadius: 15,
                  withGradient: true,
                  height: 70,
                  onClick: () async {
                    await viewController.saveDeliveryCost().then((bool? value) {
                      if (value == true) {
                        return Get.snackbar(
                            'Saved', 'Delivery cost have been saved',
                            backgroundColor: Colors.black,
                            colorText: Colors.white,
                            shouldIconPulse: false,
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ));
                      }
                    });
                  },
                ),
              ),
          ],
        ),
      ),
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
                        viewController.previewCost.value = null;
                      } else if (viewController.canCalculate) {
                        viewController.calculatePreview();
                      }
                    },
                    controller: viewController.distancePreview,
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
                  viewController.previewCost.value
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
