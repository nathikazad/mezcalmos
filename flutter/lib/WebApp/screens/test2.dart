import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/WebApp/screens/components/InstallAppBarComponent.dart';
import 'package:mezcalmos/WebApp/values/constants.dart';
import 'package:mezcalmos/WebApp/webHelpers/setUpHelper.dart';
import 'package:mezcalmos/WebApp/widgets/mezLoaderWidget.dart';
import 'package:qlevar_router/qlevar_router.dart';

class Test2 extends StatefulWidget {
  Test2({Key? key}) : super(key: key);

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  void initState() {
    mezDbgPrint(
        "]]]]]]]]]] inIt  🔥 test2 🧪  and time 📅 ${DateTime.now().toString()}");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mezDbgPrint(
          "]]]]]]]]]] build done   🔥 test2 🧪  and time 📅 ${DateTime.now().toString()}");
    });
    super.initState();
  }

  @override
  void dispose() {
    mezDbgPrint(
        "]]]]]]]]]] dispose  🔥 test2 🧪  and time 📅 ${DateTime.now().toString()}");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint(
        "]]]]]]]]]] build  🔥 test2 🧪  and time 📅 ${DateTime.now().toString()}");
    return FutureBuilder(
        future: setupFirebase(launchMode: typeMode.toLaunchMode(), func: () {}),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data == true) {
            return Scaffold(
              appBar: InstallAppBarComponent(),
              body: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                      onPressed: () {
                        QR.back();
                        // Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
                body: Center(
                  child: Text("test tow screen "),
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: MezLoaderWidget(),
              ),
            );
          }
        });
  }
}
