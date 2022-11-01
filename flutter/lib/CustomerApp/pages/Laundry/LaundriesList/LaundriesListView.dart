import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/AppBar.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundriesList/components/CustomerLaundrySelectCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Laundry"]["LaundriesListView"];

class LaundriesListView extends StatefulWidget {
  const LaundriesListView({Key? key, this.isRuningOnWeb = false})
      : super(key: key);
  final bool? isRuningOnWeb;

  @override
  State<LaundriesListView> createState() => _LaundriesListViewState();
}

class _LaundriesListViewState extends State<LaundriesListView> {
  LaundryController laundryController = Get.find<LaundryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(
        autoBack: true,
        title: '${_i18n()["laundries"]}',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Text(
                "${_i18n()["title"]}",
                style: Get.textTheme.headline2,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FutureBuilder<List<Laundry>>(
                future: laundryController.getLaundries(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Laundry>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.done:
                      if (snapshot.data != null) {
                        return Column(
                          children: List.generate(
                              snapshot.data!.length,
                              (int index) => CustomerLaundrySelectCard(
                                    laundry: snapshot.data![index],
                                    shippingPrice:
                                        laundryController.shippingPrice.value,
                                  )),
                        );
                      } else {
                        return Text("Error");
                      }

                    default:
                      return Container();
                  }
                })
          ],
        ),
      ),
    );
  }
}
