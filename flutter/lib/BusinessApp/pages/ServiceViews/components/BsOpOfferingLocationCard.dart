import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/pages/PickLocationView/PickLocationView.dart';

class BsOpOfferingLocationCard extends StatelessWidget {
  const BsOpOfferingLocationCard(
      {super.key,
      required this.onLocationSelected,
      required this.location,
      this.label = "Select Location"});
  final Function(Location) onLocationSelected;
  final Location? location;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: context.textTheme.bodyLarge,
        ),
        smallSepartor,
        Card(
          color: Colors.grey.shade200,
          child: InkWell(
            onTap: () async {
              MezLocation? newLoc = await PickLocationView.navigate(
                  initialLocation: (location != null)
                      ? LatLng(
                          location!.lat.toDouble(), location!.lng.toDouble())
                      : null);
              mezDbgPrint("Getting after await ==============>$newLoc");
              if (newLoc != null) {
                onLocationSelected.call(Location(
                    lat: newLoc.latitude,
                    lng: newLoc.longitude,
                    address: newLoc.address));
              }
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: primaryBlueColor,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        (location != null) ? location!.address : label,
                        maxLines: 1,
                      )),
                  Icon(Icons.chevron_right_rounded)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
