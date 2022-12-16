import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/RestaurantApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/sharedRouter.dart';

class ROpEditLocationCard extends StatelessWidget {
  ROpEditLocationCard({
    Key? key,
    required this.editInfoController,
  }) : super(key: key);
  ROpEditInfoController editInfoController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
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
          },
          child: Container(
            padding: const EdgeInsets.all(12),
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
                    )),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: primaryBlueColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
