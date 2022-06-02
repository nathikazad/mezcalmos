import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
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
    return Scaffold(
      appBar: CustomerAppBar(
        title: laundry.value?.info.name,
      ),
      body: Obx(() {
        if (laundry.value != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _laundryImage(),
                SizedBox(
                  height: 15,
                ),
                _laundryInfoHeader(),
                SizedBox(
                  height: 15,
                ),
                // TODO @nathikazad is there a laundry description on the model ?
                // Text(
                //   "${_i18n()["description"]}",
                //   style: Get.textTheme.bodyText1,
                // ),
                // Text("laundry.value!.info.description"),
                // const SizedBox(
                //   height: 10,
                // ),
                MezServiceOpenHours(schedule: laundry.value!.schedule!),
                SizedBox(
                  height: 15,
                ),
                ServiceLocationCard(location: laundry.value!.info.location),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
      bottomNavigationBar: _sendMyLaundryButton(),
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
        imageUrl: laundry.value!.info.image);
  }

  Widget _laundryInfoHeader() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  laundry.value!.info.name,
                  style: Get.textTheme.bodyText1,
                ),
                Row(children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Chip(
                          padding: const EdgeInsets.all(3),
                          labelStyle: Get.textTheme.bodyText2?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: primaryBlueColor),
                          label: Text(
                              "${_i18n()["minimumCost"]} \$${laundry.value!.laundryCosts.minimumCost} ")),
                    ),
                  )
                ]),
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
