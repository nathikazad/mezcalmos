// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsHomeRentalView/BsHomeRentalView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

class BsOpServicesListView extends StatefulWidget {
  const BsOpServicesListView({Key? key}) : super(key: key);

  @override
  _BsOpServicesListViewState createState() => _BsOpServicesListViewState();
}

class _BsOpServicesListViewState extends State<BsOpServicesListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu, title: "Services"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MezButton(
              label: "Add service",
              onClick: () async {
                // ignore: inference_failure_on_function_invocation
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Service type",
                                style: context.textTheme.bodyLarge,
                              ),
                            ),
                            Divider(
                              height: 35,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rental",
                                        style: context.textTheme.bodyLarge,
                                      ),
                                      Text(
                                          "Using a rental service, you can advertise a vehicle for rent.")
                                    ],
                                  ),
                                ),
                                radioCircleButton(
                                    onTap: (bool v) {}, value: true)
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Flexible(
                                    child: MezButton(
                                  label: "Cancel",
                                  backgroundColor: offRedColor,
                                  textColor: redAccentColor,
                                  onClick: () async {
                                    Navigator.pop(context);
                                  },
                                )),
                                SizedBox(
                                  width: 15,
                                ),
                                Flexible(
                                    child: MezButton(
                                  label: "Add",
                                  onClick: () async {
                                    Navigator.pop(context);
                                    BsOpHomeRentalView.navigate(id: null);
                                  },
                                ))
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
