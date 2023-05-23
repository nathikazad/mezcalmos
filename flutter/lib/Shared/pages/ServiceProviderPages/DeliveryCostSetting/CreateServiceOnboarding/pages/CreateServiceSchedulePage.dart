import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/DeliveryCostSetting/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';
import 'package:mezcalmos/Shared/widgets/MezWorkingHours/MezEditableWorkingHours.dart';

class CreateServiceSchedulePage extends StatefulWidget {
  const CreateServiceSchedulePage({
    Key? key,
    required this.viewController,
  }) : super(key: key);
  final CreateServiceViewController viewController;

  @override
  State<CreateServiceSchedulePage> createState() =>
      _CreateServiceSchedulePageState();
}

class _CreateServiceSchedulePageState extends State<CreateServiceSchedulePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: MezEditableWorkingHours(
              schedule: widget.viewController.oldSchedule.value,
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
