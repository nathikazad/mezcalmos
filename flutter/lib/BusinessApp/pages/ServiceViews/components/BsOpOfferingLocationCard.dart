import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/pages/PickLocationView/PickLocationView.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['services'];

class BsOpOfferingLocationCard extends StatelessWidget {
  const BsOpOfferingLocationCard(
      {super.key,
      required this.onLocationSelected,
      required this.location,
      this.validator,
      this.label = "Select Location"});
  final Function(Location) onLocationSelected;
  final Location? location;
  final String label;
  final String? Function(Location?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _i18n()["location"],
          style: context.textTheme.bodyLarge,
        ),
        smallSepartor,
        FormField<Location?>(
            validator: validator,
            initialValue: location,
            builder: (FormFieldState<Location?> state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: Colors.grey.shade200,
                    child: InkWell(
                      onTap: () async {
                        MezLocation? newLoc = await PickLocationView.navigate(
                            initialLocation: (location != null)
                                ? LatLng(location!.lat.toDouble(),
                                    location!.lng.toDouble())
                                : null);
                        mezDbgPrint(
                            "Getting after await ==============>$newLoc");

                        if (newLoc != null) {
                          state.didChange(Location(
                              lat: newLoc.latitude,
                              lng: newLoc.longitude,
                              address: newLoc.address));
                          onLocationSelected.call(state.value!);
                          // onLocationSelected.call(Location(
                          //     lat: newLoc.latitude,
                          //     lng: newLoc.longitude,
                          //     address: newLoc.address));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10),
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
                                  (location != null)
                                      ? location!.address
                                      : label,
                                  maxLines: 1,
                                )),
                            Icon(Icons.chevron_right_rounded)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 2, left: 12),
                    child: Text(state.errorText ?? "",
                        style: context.theme.inputDecorationTheme.errorStyle),
                  ),
                ],
              );
            }),
      ],
    );
  }
}
