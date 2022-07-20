import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class LaundryOpEditLocationCard extends StatelessWidget {
  LaundryOpEditLocationCard({
    Key? key,
    required this.editInfoController,
  }) : super(key: key);
  EditInfoController editInfoController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.grey.shade200,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () async {
            final Location newLoc = await Get.toNamed(kPickLocationEdit,
                    arguments: LatLng(
                        editInfoController.newLocation.value!.latitude,
                        editInfoController.newLocation.value!.longitude))
                as Location;
            editInfoController.setNewLocation(newLoc);
            editInfoController.newLocation.refresh();

            // await Get.toNamed(kPickLocationEdit,
            //         arguments: LatLng(
            //             editInfoController.newLocation.value!.latitude,
            //             editInfoController.newLocation.value!.longitude))!
            //     .then((value) {
            //   if (value != null) {
            //     mezDbgPrint("New location ======> ${value.adress}");
            //     editInfoController.setNewLocation(value);
            //     editInfoController.newLocation.refresh();
            //   } else {
            //     mezDbgPrint("Newloc is nuuuuuulll---------");
            //   }
            // });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 6),
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
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Text(
                      editInfoController.newLocation.value?.address ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Get.textTheme.bodyText1,
                    )),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
