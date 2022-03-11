import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/LaundryListView/Components/LaundrySelectCard.dart';
import 'package:mezcalmos/Shared/controllers/laundryInfoController.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class LaundriesListView extends StatefulWidget {
  const LaundriesListView({Key? key}) : super(key: key);

  @override
  State<LaundriesListView> createState() => _LaundriesListViewState();
}

class _LaundriesListViewState extends State<LaundriesListView> {
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laundries'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          FutureBuilder<List<Laundry>>(
              future: laundryInfoController.getLaundries(),
              builder: (context, snapshot) {
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
                            (index) => LaundrySelectCard(
                                  laundry: snapshot.data![index],
                                  function: () {
                                    if (snapshot.data![index].state.available) {
                                      Get.back(result: snapshot.data![index]);
                                    } else
                                      null;
                                  },
                                )));
                  default:
                    return Container();
                }
              })
        ],
      )),
    );
  }
}
