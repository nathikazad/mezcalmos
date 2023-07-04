import 'package:flutter/material.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/controllers/BsServicesListViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class BsItemToggleButton extends StatefulWidget {
  const BsItemToggleButton({
    super.key,
    required this.details,
    required this.viewController,
  });
  final BusinessItemDetails details;
  final BsServicesListViewController viewController;

  @override
  State<BsItemToggleButton> createState() => _BsItemToggleButtonState();
}

class _BsItemToggleButtonState extends State<BsItemToggleButton> {
  late bool isAvailable;

  @override
  void initState() {
    super.initState();
    isAvailable = widget.details.available;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: primaryBlueColor,
      onChanged: (value) async {
        setState(() {
          isAvailable = value;
        });
        final BusinessItemDetails newDetails = widget.details;
        newDetails.available = value;
        final int? response =
            await widget.viewController.changeItemAvailability(
          widget.details.id.toInt(),
          newDetails,
        );
        if (response == null) {
          setState(() {
            isAvailable = !isAvailable;
            mezDbgPrint("ERROR: updation of availability failed");
          });
        }
      },
      value: isAvailable,
    );
  }
}
