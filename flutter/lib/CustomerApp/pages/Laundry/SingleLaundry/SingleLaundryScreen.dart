import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:sizer/sizer.dart';

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
      appBar: CustomerAppBar(),
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
                Text(
                  "Description",
                  style: Get.textTheme.bodyText1,
                ),
                Text(
                  "NO desc",
                  style: Get.textTheme.bodyText2,
                ),
                SizedBox(
                  height: 10,
                ),
                _servicesComponent(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Open hours",
                  style: Get.textTheme.bodyText1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Location",
                  style: Get.textTheme.bodyText1,
                ),
                Text(
                  laundry.value!.info.location.address,
                  style: Get.textTheme.bodyText2,
                ),
              ],
            ),
          );
        } else {
          return MezLogoAnimation();
        }
      }),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.purple, customerAppColor])),
        child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(),
              backgroundColor: Colors.transparent),
          child: Text("Send my laundry"),
          onPressed: () {
            Get.toNamed(kLaundryOrderRequest, arguments: laundry.value);
          },
        ),
      ),
    );
  }

  Widget _servicesComponent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Services",
          style: Get.textTheme.bodyText1,
        ),
        SizedBox(
          height: 5,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                5,
                (int index) => _serviceComponent(
                      icon: Icons.local_laundry_service,
                      title: "Service",
                    )),
          ),
        ),
      ],
    );
  }

  Widget _serviceComponent({required IconData icon, required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: lightCustomerAppColor, shape: BoxShape.circle),
            child: Icon(
              icon,
              size: 30,
              color: customerAppColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: Get.textTheme.bodyText2?.copyWith(color: customerAppColor),
          )
        ],
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
                              color: customerAppColor),
                          label: Text(
                              "Minmum cost \$${laundry.value!.laundryCosts.minimumCost} ")),
                    ),
                  )
                ]),
              ],
            ),
          ),
          Flexible(
              child: Column(
            children: [
              Text("Starting from"),
              Text(
                "\$${laundry.value!.getCheapestCategory}/KG",
                style: Get.textTheme.bodyText1
                    ?.copyWith(color: Get.theme.primaryColorLight),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
