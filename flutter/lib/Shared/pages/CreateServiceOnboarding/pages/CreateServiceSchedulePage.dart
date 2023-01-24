import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/components/CreateServiceScheduleWidgets.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';

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
  late CreateServiceScheduleWidgets viewWidgets;
  @override
  void initState() {
    viewWidgets = CreateServiceScheduleWidgets(
        viewController: widget.viewController, context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: viewWidgets.editWorkingHoursComponent(),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
