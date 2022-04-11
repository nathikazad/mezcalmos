import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

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
    mezDbgPrint(laundryInfoController.laundry);
    laundry = laundryInfoController.laundry;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blueGrey,
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
        SizedBox(
          height: 15,
        ),
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
        Text(
          "Working hours ",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
