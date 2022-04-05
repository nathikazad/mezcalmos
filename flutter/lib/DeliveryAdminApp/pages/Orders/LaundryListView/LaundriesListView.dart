import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryListView/Components/LaundrySelectCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/laundryInfoController.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["laundryListView"]["laundriesListView"];

class LaundriesListView extends StatelessWidget {
  const LaundriesListView({Key? key}) : super(key: key);

  /// LaundryInfoController
  static final LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_i18n()["title"]}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FutureBuilder<List<Laundry>>(
              future: laundryInfoController.getLaundries(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Laundry>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    );

                  case ConnectionState.done:
                    return Column(
                      children: List.generate(
                        snapshot.data!.length,
                        (int index) => LaundrySelectCard(
                          laundry: snapshot.data![index],
                          function: () {
                            if (snapshot.data![index].state.available) {
                              Get.back(result: snapshot.data![index]);
                            }
                          },
                        ),
                      ),
                    );
                  default:
                    return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
