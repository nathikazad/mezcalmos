import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/laundry/LaundryController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
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
                            snapshot.data!.length,
                            (int index) => SingleLaundryCard(
                                  laundry: snapshot.data![index],
                                )),
                      );

                    default:
                      return Container();
                  }
                })
            //
            //
            //
            //
          ],
        ),
      ),
    );
  }
}

class SingleLaundryCard extends StatelessWidget {
  const SingleLaundryCard({Key? key, required this.laundry}) : super(key: key);
  final Laundry laundry;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Get.toNamed(kLaundryOrderRequest, arguments: laundry);
      },
      child: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        CachedNetworkImageProvider(laundry.info.image),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          laundry.info.name,
                          style: Get.textTheme.bodyText1,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.place,
                              color: keyAppColor,
                            ),
                            Flexible(
                              child: Text(laundry.info.location?.address ?? "",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: Get.textTheme.subtitle1,
                                  maxLines: 1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Divider(),
            Theme(
                data: Get.theme.copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                    childrenPadding: const EdgeInsets.all(1),
                    title: Text('Costs'),
                    children: List.generate(
                        laundry.laundryCosts.lineItems.length,
                        (int index) => _laundryCostItemCard(
                            item: laundry.laundryCosts.lineItems[index])),
                  ),
                ))
          ],
        ),
      ),
    ));
  }

  Widget _laundryCostItemCard({
    required LaundryCostLineItem item,
  }) {
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return Theme(
      data: Get.theme,
      child: Container(
        padding: const EdgeInsets.all(8),
        // decoration: BoxDecoration(
        //     border: Border(
        //         bottom: BorderSide(width: 1, color: Colors.grey.shade200))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.name[userLanguage] ?? "",
                    style: Get.textTheme.bodyText1),
                Text(
                  "\$${item.cost.round()} /KG",
                  style: Get.textTheme.bodyText1!.copyWith(color: keyAppColor),
                )
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
