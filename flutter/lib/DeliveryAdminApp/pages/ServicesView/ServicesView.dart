import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  RxList<Laundry> laundries = RxList([]);
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();

  @override
  void initState() {
    getLaundries();
    super.initState();
  }

  Future<void> getLaundries() async {
    laundries.value = await laundryInfoController.getLaundries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: Get.back, title: "Services"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<Laundry>>(
                future: laundryInfoController.getLaundries(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Laundry>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      return Column(
                        children: List.generate(snapshot.data!.length,
                            (int index) => _laundryCard(snapshot.data![index])),
                      );
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    default:
                      return Container();
                  }
                })
            // Column(
            //   children: List.generate(laundries.length,
            //       (int index) => _laundryCard(laundries[index])),
            // )
          ],
        ),
      ),
    );
  }

  Widget _laundryCard(Laundry laundry) {
    return Card(
      margin: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: CachedNetworkImageProvider(laundry.info.image),
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      laundry.info.name,
                      style: Get.textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.all(3),
                              primary: primaryBlueColor),
                          onPressed: () {
                            Get.toNamed(
                                getEditInfoRoute(laundryId: laundry.info.id));
                          },
                          icon: Icon(Icons.person),
                          label: Text("Edit profile"),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            Get.toNamed(
                                getAdminRoute(laundryId: laundry.info.id));
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.all(3),
                              primary: primaryBlueColor),
                          icon: Icon(Icons.settings),
                          label: Text("Edit Admin"),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
