import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsHomeRentalView/controllers/BsHomeRentalViewController.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezItemAvSwitcher.dart';

class BsOpHomeRentalView extends StatefulWidget {
  const BsOpHomeRentalView({Key? key}) : super(key: key);
  static Future<bool?> navigate({required int? id}) async {
    String route = BusinessOpRoutes.kBsOpHomeRental;
    route = route.replaceFirst(":id", id?.toString() ?? "add");
    await MezRouter.toPath(route);
    return MezRouter.backResult;
  }

  @override
  _BsOpHomeRentalViewState createState() => _BsOpHomeRentalViewState();
}

class _BsOpHomeRentalViewState extends State<BsOpHomeRentalView> {
  BsHomeRentalViewController viewController = BsHomeRentalViewController();
  @override
  void initState() {
    int? id = MezRouter.urlArguments["id"]?.asInt;
    if (id != null) {
      viewController.initEditMode(id: id);
    }

    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
        MezRouter.back(backResult: viewController.shouldRefetch);
      },
          titleWidget: Obx(() => Text(viewController.rental != null
              ? "${viewController.rental!.details.name[userLanguage] ?? ""}"
              : "Home rental"))),
      bottomNavigationBar: MezButton(
        label: "Save",
        borderRadius: 0,
        onClick: () async {
          await viewController.save();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: viewController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => MezItemAvSwitcher(
                  value: viewController.isAvailable.value,
                  onAvalableTap: () {
                    viewController.isAvailable.value = true;
                  },
                  onUnavalableTap: () {
                    viewController.isAvailable.value = false;
                  },
                ),
              ),
              bigSeperator,
              Text(
                "Images",
                style: context.textTheme.bodyLarge,
              ),
              Text(
                "You can only upload up to five images.",
              ),
              smallSepartor,
              Obx(
                () => Wrap(
                    spacing: 8,
                    runSpacing: 5,
                    children: List.generate(
                      5,
                      (int index) {
                        bool hasImage = viewController.getImage(index) != null;
                        mezDbgPrint(hasImage);
                        return InkWell(
                          onTap: () {
                            viewController.addItemImage(
                                itemIndex: index, context: context);
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Ink(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                              image: hasImage
                                  ? DecorationImage(
                                      image: viewController.getImage(index)!,
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: hasImage == false
                                ? Icon(
                                    Icons.add_photo_alternate,
                                    color: Colors.grey,
                                    size: 35,
                                  )
                                : Container(),
                          ),
                        );
                      },
                    )),
              ),
              bigSeperator,
              Text(
                "Name",
                style: context.textTheme.bodyLarge,
              ),
              smallSepartor,
              TextFormField(
                controller: viewController.nameController,
                decoration: InputDecoration(
                  hintText: "Add item name",
                ),
              ),
              bigSeperator,
              Text(
                "Description",
                style: context.textTheme.bodyLarge,
              ),
              smallSepartor,
              TextFormField(
                maxLines: 7,
                minLines: 5,
                controller: viewController.descriptionController,
                decoration: InputDecoration(
                  hintText: "Enter a description for your item",
                ),
              ),
              bigSeperator,
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      "Prices",
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        if (viewController.units.length > 1) {
                          _timeUnitSelectorSheet(context);
                        } else if (viewController.units.length == 1) {
                          viewController
                              .addPriceTimeUnit(viewController.units.first);
                        }
                      },
                      child: Ink(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              size: 20,
                              color: primaryBlueColor,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Add price",
                              style: context.textTheme.bodyLarge
                                  ?.copyWith(color: primaryBlueColor),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              smallSepartor,
              Obx(
                () => Column(
                    children: List.generate(
                        viewController.priceTimeUnitMap.length,
                        (int index) => _priceCard(
                            textEditingController: viewController
                                .priceTimeUnitMap.entries
                                .toList()[index]
                                .key,
                            timeUnit: viewController.priceTimeUnitMap.entries
                                .toList()[index]
                                .value))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _timeUnitSelectorSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          Rxn<TimeUnit> selected = Rxn();
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Price type",
                    style: context.textTheme.bodyLarge,
                  ),
                ),
                Divider(
                  height: 35,
                ),
                Column(
                  children: viewController.units.map((TimeUnit timeUnit) {
                    return Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              timeUnit.toFirebaseFormatString(),
                              style: context.textTheme.bodyLarge,
                            ),
                          ),
                          Obx(
                            () => radioCircleButton(
                                onTap: (bool v) {
                                  if (!v) {
                                    selected.value = timeUnit;
                                  } else {
                                    selected.value = null;
                                  }
                                },
                                value: timeUnit == selected.value),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
                bigSeperator,
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
                        if (selected.value != null) {
                          viewController.addPriceTimeUnit(selected.value!);
                          Navigator.pop(context, selected.value);
                        }
                      },
                    ))
                  ],
                ),
              ],
            ),
          );
        });
  }

  Container _priceCard(
      {required TextEditingController textEditingController,
      required TimeUnit timeUnit}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Flexible(
              flex: 2,
              child: TextFormField(
                style: context.textTheme.bodyLarge,
                decoration: InputDecoration(
                    hintText: "Price",
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ).tighten(width: 80),
                    prefixIcon: Icon(Icons.attach_money),
                    suffixIcon: Text(
                      "${timeUnit.toFirebaseFormatString()}",
                      style: context.textTheme.bodyLarge,
                    )),
                controller: textEditingController,
              )),
          SizedBox(
            width: 8,
          ),
          MezIconButton(
              onTap: () {
                viewController.removeTimeUnit(timeUnit);
              },
              iconSize: 20,
              backgroundColor: Colors.transparent,
              iconColor: redAccentColor,
              icon: Icons.delete_outline)
          // Flexible(
          //   child: MezDropDown(
          //     hintText: "Price",
          //     itemsList: TimeUnit.values
          //         .map((TimeUnit e) => e.toFirebaseFormatString())
          //         .toList(),
          //     onChanged: (String? v) {},
          //   ),
          // ),
        ],
      ),
    );
  }
}

class MezDropDown extends StatelessWidget {
  final String hintText;
  final String? initialValue;
  final List<String> itemsList;
  final Function(String?) onChanged;

  const MezDropDown({
    required this.hintText,
    required this.itemsList,
    required this.onChanged,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none),
      ),
      items: itemsList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: initialValue,
      onChanged: onChanged,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }
}
