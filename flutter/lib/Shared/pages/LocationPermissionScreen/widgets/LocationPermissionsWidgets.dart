import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen/controller/LocationPermissionController.dart';

class LocationPermissionWidgets {
  final LocationPermissionController viewController;

  LocationPermissionWidgets({required this.viewController});

  void setLocationSteps({LocationPermissionsStatus? status}) {
    List<Widget> _columnChildren = <Widget>[];
    // at this point we're sure  locationType is never null
    // first  - Service enabled
    _columnChildren.add(
      getStepRow(
        bgColor: status == LocationPermissionsStatus.ServiceOff
            ? Colors.red
            : Colors.green,
        stepIndex: "1",
        textHint: "Enable Location Service.",
        status: status,
      ),
    );

    if (viewController.locationController.locationType ==
        LocationPermissionType.Foreground) {
      //
      _columnChildren.add(
        getStepRow(
          bgColor: status == LocationPermissionsStatus.Ok
              ? Colors.red
              : Colors.green,
          stepIndex: "2",
          textHint: "Foreground location permissions.",
          status: status,
        ),
      );
    } else {
      // BACKGROUND
      _columnChildren.add(
        getStepRow(
          bgColor: status == LocationPermissionsStatus.Ok
              ? Colors.red
              : Colors.green,
          stepIndex: "2",
          textHint: "Background location permissions.",
          status: status,
        ),
      );
    }
  }

  Row getStepRow(
      {required String stepIndex,
      LocationPermissionsStatus? status,
      required Color bgColor,
      required String textHint}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
          child: Center(
              child: Text(
            stepIndex,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        Spacer(),
        Text(textHint),
        Spacer(),
      ],
    );
  }
}
