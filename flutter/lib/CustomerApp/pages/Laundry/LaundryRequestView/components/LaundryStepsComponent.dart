import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
        ['LaundryRequestView']['Components']['LaundryStepsComponent'];

class LaundryStepsComponent extends StatefulWidget {
  const LaundryStepsComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<LaundryStepsComponent> createState() => _LaundryStepsComponentState();
}

class _LaundryStepsComponentState extends State<LaundryStepsComponent> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              stepComponent(context, 1),
              const Expanded(child: Divider()),
              stepComponent(context, 2),
              const Expanded(child: Divider()),
              stepComponent(context, 3),
            ],
          ),
          const SizedBox(height: 10),
          Card(
            child: Container(
              margin: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: Text(
                getDescription(index),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(height: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Material stepComponent(BuildContext context, int value) {
    return Material(
      shape: CircleBorder(),
      color: (index == value)
          ? Theme.of(context).primaryColorLight
          : Colors.grey.shade400,
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          setState(() {
            index = value;
          });
        },
        child: Ink(
          padding: const EdgeInsets.all(16),
          child: Text(
            value.toString(),
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

String getDescription(int index) {
  switch (index) {
    case 1:
      return _i18n()['firstStep'];
    case 2:
      return _i18n()['secondStep'];
    case 3:
      return _i18n()['thirdStep'];
    default:
      return '';
  }
}
