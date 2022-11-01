import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mez_services_web_app/services/widgets/mezCalmosResizer.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constarints) {
          if (MezCalmosResizer.isDesktop(context) ||
              MezCalmosResizer.isSmallDesktop(context)) {
            //for Desktop
            return _buildWidgetForDesktop(context);
          } else if (MezCalmosResizer.isTablet(context) ||
              MezCalmosResizer.isSmallTablet(context)) {
            // for tablet
            return _buildWidgetForTablet(context);
          } else {
            // for mobile
            return _buildWidgetForMobile(context);
          }
        },
      ),
    );
  }
}

Widget _buildWidgetForDesktop(BuildContext context) {
  return Container(
    width: Get.width,
    child: Row(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
              child: Center(
                child: Text("2/3"),
              ),
            )),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow,
              child: Center(
                child: Text("1/3"),
              ),
            ))
      ],
    ),
  );
}

Widget _buildWidgetForTablet(BuildContext context) {
  return Container(
    width: Get.width,
    child: Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              child: Center(
                child: Text("1/2"),
              ),
            )),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow,
              child: Center(
                child: Text("1/2"),
              ),
            ))
      ],
    ),
  );
}

Widget _buildWidgetForMobile(BuildContext context) {
  return Container(
    height: Get.height,
    child: Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              child: Center(
                child: Text("1/2"),
              ),
            )),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow,
              child: Center(
                child: Text("1/2"),
              ),
            ))
      ],
    ),
  );
}
