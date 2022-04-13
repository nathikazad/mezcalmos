import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/DashboardView/InfoView/components/CategoryCard.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/widgets/MezWorkingHours.dart';

import '../../../controllers/laundryInfoController.dart';

class LaundryOpInfoView extends StatefulWidget {
  const LaundryOpInfoView({Key? key}) : super(key: key);

  @override
  State<LaundryOpInfoView> createState() => _LaundryOpInfoViewState();
}

class _LaundryOpInfoViewState extends State<LaundryOpInfoView> {
  // CONTROLLERS
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  Rxn<Laundry> laundry = Rxn();
  @override
  void initState() {
// get Laundry info
    laundry = laundryInfoController.laundry;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        padding: const EdgeInsets.all(10),
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:
                CachedNetworkImageProvider(laundry.value?.info.image ?? ''),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              laundry.value?.info.name ?? 'Laundry name',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextButton.icon(
              onPressed: () {
                Get.toNamed(kEditInfoView);
              },
              icon: Icon(Icons.edit),
              label: Text("Edit my informations")),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Card(
                color: Colors.white,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.add,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          Text(
                            'Add Category',
                          ),
                        ]),
                  ),
                ),
              )
            ],
          ),
          Column(
              children: List.generate(
                  laundry.value!.laundryCosts.lineItems.length,
                  (int index) => CategoryCard(
                      laundryCostLineItem:
                          laundry.value!.laundryCosts.lineItems[index]))),
          Divider(),
          Text(
            'Location',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Row(
                children: [
                  Icon(
                    Icons.place_rounded,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      child: Text(
                    laundry.value?.info.location?.address ?? 'Laundry adress',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          MezWorkingHours(schedule: laundry.value!.schedule!),
        ],
      ),
    );
  }
}
