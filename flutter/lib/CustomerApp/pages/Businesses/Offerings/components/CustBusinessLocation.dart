import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessHeading.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessSubHeading.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:sizer/sizer.dart';

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
    final Location newLocationData = Location(
      lat: location?.lat ?? 0,
      lng: location?.lng ?? 0,
      address: location?.address ?? "No address",
    );
    return ServiceLocationCard(
      height: 20.h,
      location: MezLocation.fromFirebaseData(
        newLocationData.toFirebaseFormattedJson(),
      ),
    );
  }
}
