import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/CustomerApp/components/MyExpensionPanelComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/controllers/CustCartViewController.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/controllers/OfferingViewController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class CustCartView extends StatefulWidget {
  const CustCartView({super.key});

  @override
  State<CustCartView> createState() => _CustCartViewState();

  static Future<void> navigate({required CartInfo cartInfo}) {
    return MezRouter.toPath(CustBusinessRoutes.custCartRoute, arguments: {
      "cartInfo": cartInfo,
    });
  }
}

class _CustCartViewState extends State<CustCartView> {
  final CustCartViewController viewController = CustCartViewController();
  late CartInfo cartInfo;

  @override
  void initState() {
    viewController.init();
    cartInfo = MezRouter.bodyArguments!["cartInfo"] as CartInfo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: MezRouter.back,
        title: "My Cart",
      ),
      bottomNavigationBar: MezButton(
        label: "Request",
        withGradient: true,
        borderRadius: 0,
        onClick: () async {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Item 1",
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        Text(
                          "Delete",
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              MyExpansionPanelComponent(
                showExpandButton: false,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            child: CachedNetworkImage(
                              width: 65,
                              height: 65,
                              imageUrl: cartInfo.image,
                              imageBuilder: (_, ImageProvider imageProvider) {
                                return Container(
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: imageProvider,
                                    ),
                                  ),
                                );
                              },
                              errorWidget: (_, __, ___) => Container(
                                width: 65,
                                height: 65,
                                child: Container(
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(aNoImage))),
                                ),
                              ),
                              placeholder: (_, __) => Container(
                                width: 80,
                                height: 60,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${cartInfo.itemName.getTranslation(userLanguage)!.inCaps}",
                                  style: context.textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                    ),
                                    Text(
                                      "${cartInfo.totalPeople}",
                                      style: context.textTheme.bodyMedium!
                                          .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(aPriceCheck),
                                    Text(
                                      "\$${cartInfo.unitPrice.toStringAsFixed(0)} x ${cartInfo.duration} ${cartInfo.unitDuration} = \$${cartInfo.totalPrice.toStringAsFixed(0)}",
                                      style: context.textTheme.bodyMedium!
                                          .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      // Divider(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.access_time_filled,
                            ),
                          ),
                          Text(
                            "${cartInfo.startTime.getOrderTime()}",
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                children: [],
              ),
              bigSeperator,
              Text(
                "Notes",
                style: context.textTheme.bodyLarge,
              ),
              smallSepartor,
              TextFormField(
                maxLines: 5,
                minLines: 3,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Write your notes here.",
                ),
              ),
              bigSeperator,
              MezCard(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Summary",
                      style: context.textTheme.bodyLarge,
                    ),
                    smallSepartor,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order cost",
                          style: context.textTheme.bodyMedium,
                        ),
                        Text(
                          "\$${cartInfo.totalPrice.toStringAsFixed(0)}",
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
