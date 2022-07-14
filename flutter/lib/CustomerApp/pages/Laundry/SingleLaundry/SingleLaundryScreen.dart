import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/widgets/MezServiceOpenHours.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Laundry"]["SingleLaundryScreen"];

class SingleLaundryScreen extends StatefulWidget {
  const SingleLaundryScreen({Key? key}) : super(key: key);

  @override
  State<SingleLaundryScreen> createState() => _SingleLaundryScreenState();
}

class _SingleLaundryScreenState extends State<SingleLaundryScreen> {
  LaundryController laundryController = Get.find<LaundryController>();
  String? laundryId;
  Rxn<Laundry> laundry = Rxn();
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  @override
  void initState() {
    // TODO: implement initState
    laundryId = Get.parameters["laundryId"];
    if (laundryId != null) {
      laundryController
          .getLaundry(laundryId!)
          .then((Laundry value) => laundry.value = value);
    } else {
      Get.back();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (laundry.value != null) {
          return Scaffold(
            appBar: CustomerAppBar(
              title: laundry.value?.info.name,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _laundryImage(),
                  SizedBox(
                    height: 20,
                  ),
                  _laundryInfoHeader(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${_i18n()["categories"]}",
                    style: Get.textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: List.generate(
                        laundry.value!.laundryCosts.lineItems.length,
                        (int index) => _laundryCostCard(
                            item:
                                laundry.value!.laundryCosts.lineItems[index])),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MezServiceOpenHours(schedule: laundry.value!.schedule!),
                  SizedBox(
                    height: 20,
                  ),
                  ServiceLocationCard(location: laundry.value!.info.location),
                ],
              ),
            ),
            bottomNavigationBar: _sendMyLaundryButton(),
          );
        } else
          return Container();
      },
    );
  }

  Widget _laundryCostCard({required LaundryCostLineItem item}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Text(
              item.name[userLanguage]?.toString().inCaps ?? "",
              style: Get.textTheme.bodyText2,
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "${item.cost.toPriceString()}/KG",
            style: Get.textTheme.bodyText1?.copyWith(color: primaryBlueColor),
          )
        ],
      ),
    );
  }

  Widget _sendMyLaundryButton() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.purple, primaryBlueColor])),
      child: TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(),
            backgroundColor: Colors.transparent),
        child: Text("${_i18n()["sendMyLaundry"]}"),
        onPressed: () {
          Get.toNamed(kLaundryOrderRequest, arguments: laundry.value);
        },
      ),
    );
  }

  Widget _laundryImage() {
    return CachedNetworkImage(
        width: double.infinity,
        height: 20.h,
        fit: BoxFit.cover,
        imageUrl: laundry.value!.info.image);
  }

  Widget _laundryInfoHeader() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  laundry.value!.info.name,
                  style: Get.textTheme.bodyText1,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: SecondaryLightBlueColor),
                  child: Text(
                    "${_i18n()["minimumCost"]} \$${laundry.value!.laundryCosts.minimumCost} ",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.w700, color: primaryBlueColor),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${_i18n()["startingFrom"]}",
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "\$${laundry.value!.getCheapestCategory}/KG",
                      style: Get.textTheme.bodyText1
                          ?.copyWith(color: Get.theme.primaryColorLight),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
