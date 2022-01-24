import 'package:flutter/material.dart';

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
        children: [
          Row(
            children: [
              stepComponent(context, 1),
              Expanded(child: Divider()),
              stepComponent(context, 2),
              Expanded(child: Divider()),
              stepComponent(context, 3),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              margin: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: Text(
                getDescription(index),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(height: 1.5),
              ),
            ),
          )
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
      return 'First step is creating an order once you create an order one of our drivers will be reaching your location to pickup your things';
    case 2:
      return 'Second step our laundry service provider will recieve your order and start doing his work and we will inform you about price changes depending on the order weight';
    case 3:
      return 'Final step once your order is ready one of our driver will pickup the order from the laundry and get it to your location as soon as possible';
    default:
      return '';
  }
}
