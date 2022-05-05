import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/CustomerApp/pages/Laundry/LaundriesList/components/CustomerLaundrySelectCard.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class LaundriesListView extends StatefulWidget {
  const LaundriesListView({Key? key}) : super(key: key);

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
        title: 'Laundries',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
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
                      return Column(
                        children: List.generate(
                            snapshot.data?.length ?? 0,
                            (int index) => CustomerLaundrySelectCard(
                                  laundry: snapshot.data![index],
                                )),
                      );

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
