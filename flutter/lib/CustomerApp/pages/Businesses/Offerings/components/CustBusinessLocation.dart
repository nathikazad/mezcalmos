import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessHeading.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessSubHeading.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class CustBusinessLocation extends StatelessWidget {
  const CustBusinessLocation({
    super.key,
    required this.location,
  });

  final Location? location;

  @override
  Widget build(BuildContext context) {
    if (location == null) {
      return SizedBox.shrink();
    }
    return Column(
      children: [
        CustBusinessHeading(
          text: "Location",
        ),
        CustBusinessSubHeading(
          text: location?.address ?? "",
        ),
      ],
    );
  }
}
