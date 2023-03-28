import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/pages/PickLocationView/PickLocationView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceInfoEditView/controllers/ServiceInfoEditViewController.dart';

class ServiceEditLocationCard extends StatelessWidget {
  ServiceEditLocationCard({
    Key? key,
    required this.editInfoController,
  }) : super(key: key);
  ServiceInfoEditViewController editInfoController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        color: Colors.grey.shade200,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () async {
            final MezLocation? newLoc = await PickLocationView.navigate(
                initialLocation: LatLng(
                    editInfoController.service.value!.location.latitude,
                    editInfoController.service.value!.location.longitude));
            mezDbgPrint("Getting after await ==============>$newLoc");
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
