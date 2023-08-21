import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsCoWorkingView/controllers/BsCoWorkingViewController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpOfferingLocationCard.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpOfferingPricesList.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpServiceImagesGrid.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/BusinessApp/pages/components/BsDeleteOfferButton.dart';
import 'package:mezcalmos/BusinessApp/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/RentalHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezItemAvSwitcher.dart';
import 'package:mezcalmos/Shared/widgets/MezStringDropDown.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['services'];

class BsCoWorkingView extends StatefulWidget {
  const BsCoWorkingView({Key? key}) : super(key: key);
  static Future<bool?> navigate(
      {required int? id,
      required int businessDetailsId,
      required int businessId}) async {
    String route = BusinessOpRoutes.kBsCoWorking;
    route = route.replaceFirst(":id", id?.toString() ?? "add");
    await MezRouter.toPath(route, arguments: {
      "businessDetailsId": businessDetailsId,
      "businessId": businessId
    });
    return MezRouter.backResult;
  }

  @override
  _BsCoWorkingViewState createState() => _BsCoWorkingViewState();
}

class _BsCoWorkingViewState extends State<BsCoWorkingView>
    with TickerProviderStateMixin {
  BsCoWorkingViewController viewController = BsCoWorkingViewController();
  int? businessId;
  int? businessDetailsId;
  int? homeRentalId;

  final FocusNode nameNode = FocusNode();
  final FocusNode descriptionNode = FocusNode();

  @override
  void initState() {
    _assignValues();

    if (businessDetailsId == null || businessId == null) {
      throw Exception("detailsId is null");
    }

    viewController.init(
        thickerProvider: this,
        homeRentalId: homeRentalId,
        detailsId: businessDetailsId!,
        businessId: businessId!);

    super.initState();
  }

  void _assignValues() {
    businessDetailsId = int.tryParse(
        MezRouter.bodyArguments?["businessDetailsId"].toString() ?? "");
    businessId =
        int.tryParse(MezRouter.bodyArguments?["businessId"].toString() ?? "");
    homeRentalId = int.tryParse(MezRouter.urlArguments["id"].toString());
  }

  @override
  void dispose() {
    viewController.dispose();
    nameNode.dispose();
    descriptionNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      bottomNavigationBar: Obx(
        () => MezButton(
          label: _i18n()["save"],
          withGradient: true,
          borderRadius: 0,
          onClick: () async {
            await viewController.save();
          },
        ),
      ),
      body: Obx(
        () {
          if (viewController.hasData) {
            return Column(
              children: [
                if (viewController.hasSecondaryLang)
                  PreferredSize(
                      preferredSize: Size.fromHeight(50),
                      child: Material(
                        color: Colors.white,
                        child: TabBar(
                            tabs: [
                              Tab(
                                text: viewController.languages!.primary
                                    .toLanguageName(),
                              ),
                              Tab(
                                text: viewController.languages!.secondary!
                                    .toLanguageName(),
                              )
                            ],
                            controller: viewController
                                .languageTabsController.tabController),
                      )),
                Expanded(
                  child: TabBarView(
                    controller:
                        viewController.languageTabsController.tabController,
                    children: [
                      Form(
                          key: viewController
                              .languageTabsController.primaryLangFormKey,
                          child: _primaryTab(context)),
                      if (viewController.hasSecondaryLang)
                        Form(
                            key: viewController
                                .languageTabsController.secondaryLangFormKey,
                            child: _secondaryTab(context)),
                    ],
                  ),
                ),
              ],
            );
          } else
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }

  AppBar _appbar() {
    return MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
      MezRouter.back(backResult: viewController.shouldRefetch);
    },
        titleWidget: Obx(() => Text(viewController.rental != null
            ? "${viewController.rental!.details.name.getTranslation(viewController.languages!.primary)}"
            : _i18n()["coWorking"]["title"])));
  }

  Widget _secondaryTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _i18n()["name"],
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            controller: viewController.detailsController.scNameController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return _i18n()["nameError"];
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: _i18n()["nameHint"],
            ),
          ),
          bigSeperator,
          Text(
            _i18n()["description"],
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            maxLines: 7,
            minLines: 5,
            controller:
                viewController.detailsController.scDescriptionController,
            decoration: InputDecoration(
              hintText: _i18n()["descriptionHint"],
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return _i18n()["descriptionError"];
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  void _focus(FocusNode node) {
    FocusScope.of(context).unfocus();
    node.requestFocus();
  }

  Widget _primaryTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => MezItemAvSwitcher(
              value: viewController.detailsController.isAvailable.value,
              onAvalableTap: () {
                viewController.detailsController.switchAvailable(true);
              },
              onUnavalableTap: () {
                viewController.detailsController.switchAvailable(false);
              },
            ),
          ),
          bigSeperator,
          Text(
            _i18n()["image"],
            style: context.textTheme.bodyLarge,
          ),
          Text(
            _i18n()["imageInfo"],
          ),
          smallSepartor,
          BsOpServiceImagesGrid(
            detailsController: viewController.detailsController,
          ),
          // bigSeperator,
          Text(
            _i18n()["name"],
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            focusNode: nameNode,
            controller: viewController.detailsController.nameController,
            decoration: InputDecoration(
              hintText: _i18n()["nameHint"],
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                _focus(nameNode);
                return _i18n()["nameError"];
              }
              return null;
            },
          ),
          bigSeperator,
          Text(
            _i18n()["description"],
            style: context.textTheme.bodyLarge,
          ),
          smallSepartor,
          TextFormField(
            focusNode: descriptionNode,
            maxLines: 7,
            minLines: 5,
            controller: viewController.detailsController.descriptionController,
            decoration: InputDecoration(
              hintText: _i18n()["descriptionHint"],
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                _focus(descriptionNode);
                return _i18n()["descriptionError"];
              }
              return null;
            },
          ),
          smallSepartor,
          Obx(
            () => BsOpOfferingLocationCard(
              location: viewController.homeLocation.value,
              label: _i18n()["coWorking"]["homeLocation"],
              locationLabelStyle: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              onLocationSelected: (Location loc) {
                viewController.homeLocation.value = loc;
              },
              validator: (Location? loc) {
                if (loc == null) {
                  return _i18n()["locationError"];
                }
                return null;
              },
            ),
          ),
          smallSepartor,
          Text(
            '${_i18n()["coWorking"]["coWorkingType"]}',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          smallSepartor,
          // Obx(() {
          //   List<CoWorkingCategory1> possibleItems = [
          //     ...CoWorkingCategory1.values
          //   ];
          //   return MezStringDropDown(
          //     validator: (String? value) {
          //       if (viewController.homeType.value == null) {
          //         return _i18n()["coWorking"]["homeTypeError"];
          //       }
          //       return null;
          //     },
          //     langPath: _i18n()["coWorking"],
          //     items: possibleItems
          //         .map((CoWorkingCategory1 e) => e.toFirebaseFormatString())
          //         .toList(),
          //     value: viewController.homeType.value?.toFirebaseFormatString(),
          //     onChanged: (String? newHomeType) {
          //       if (newHomeType != null) {
          //         viewController
          //             .changeHomeType(newHomeType.toCoWorkingCategory1());
          //       }
          //     },
          //     labelText: _i18n()["coWorking"]["homeType"],
          //   );
          // }),
          // bigSeperator,

          // if (viewController.homeType == CoWorkingCategory1.DedicatedDesk)
          //   _singlePriceView(),

          // if (viewController.homeType == CoWorkingCategory1.PrivateRoom ||
          //     viewController.homeType == CoWorkingCategory1.FullFloorOffice)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${_i18n()["coWorking"]["coWorkingType"]} 1",
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                      onTap: () async {
                        viewController.addNewRoom();
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
                              "Add additional room",
                              style: context.textTheme.bodyLarge
                                  ?.copyWith(color: primaryBlueColor),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              Obx(() {
                return MezStringDropDown(
                  validator: (String? value) {
                    if (viewController.roomType.value == null) {
                      return _i18n()["coWorking"]["homeTypeError"];
                    }
                    return null;
                  },
                  langPath: _i18n()["coWorking"],
                  items: CoWorkingRoomType.values
                      .map((CoWorkingRoomType e) => e.toFirebaseFormatString())
                      .toList(),
                  value:
                      viewController.roomType.value?.toFirebaseFormatString(),
                  onChanged: (String? newRoomType) {
                    if (newRoomType != null) {
                      viewController.roomType.value =
                          newRoomType.toCoWorkingRoomType();
                    }
                  },
                  labelText: _i18n()["coWorking"]["homeType"],
                );
              }),
              smallSepartor,
              Column(
                children: [
                  Obx(
                    () => BsOpOfferingPricesList(
                      availbleUnits: viewController.avalbleUnits,
                      onAddPrice: (TimeUnit unit) {
                        viewController.detailsController
                            .addPriceTimeUnit(timeUnit: unit);
                      },
                      onRemovePrice: (TimeUnit unit) {
                        viewController.detailsController.removeTimeUnit(unit);
                      },
                      seletedPrices:
                          viewController.detailsController.priceTimeUnitMap,
                    ),
                  ),
                ],
              ),
              smallSepartor,
              if (viewController.roomType.value !=
                  CoWorkingRoomType.PrivateRoom)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smallSepartor,
                    Text(
                      "Number of desk",
                      style: context.textTheme.bodyLarge,
                    ),
                    TextField(
                      controller: viewController.deskController,
                    ),
                    smallSepartor,
                    Text(
                      "Surface area",
                      style: context.textTheme.bodyLarge,
                    ),
                    TextField(
                      controller: viewController.areaController,
                      decoration: InputDecoration(
                        suffix: Text("Sq ft"),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          _multipleRoomPriceView(),

          if (viewController.isEditing)
            BsDeleteOfferButton(
              onDelete: () async {
                await viewController.deleteOffer();
                await MezRouter.back(backResult: true);
              },
            )
        ],
      ),
    );
  }

  Widget _multipleRoomPriceView() {
    return Obx(() {
      return Column(
        children: [
          ...viewController.additionalRooms.asMap().entries.map(
            (data) {
              final int index = data.key;
              return Column(
                children: [
                  smallSepartor,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${_i18n()["coWorking"]["coWorkingType"]} ${index + 2}",
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                          onTap: () async {
                            viewController.deleteNewRoom(index);
                          },
                          child: Ink(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.delete_outline,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Remove",
                                  style: context.textTheme.bodyLarge
                                      ?.copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  smallSepartor,
                  Obx(() {
                    return MezStringDropDown(
                      validator: (String? value) {
                        if (viewController.additionalRooms[index]["roomType"] ==
                            null) {
                          return _i18n()["coWorking"]["homeTypeError"];
                        }
                        return null;
                      },
                      langPath: _i18n()["coWorking"],
                      items: CoWorkingRoomType.values
                          .map((CoWorkingRoomType e) =>
                              e.toFirebaseFormatString())
                          .toList(),
                      value: viewController.additionalRooms[index]["roomType"],
                      onChanged: (String? newRoomType) {
                        if (newRoomType != null) {
                          viewController.additionalRooms[index]["roomType"] =
                              newRoomType
                                  .toCoWorkingRoomType()
                                  .toFirebaseFormatString();
                          mezDbgPrint(
                              "newRoomType: ${viewController.additionalRooms[index]["roomType"]}");
                        }
                      },
                      labelText: _i18n()["coWorking"]["homeType"],
                    );
                  }),
                  Column(
                    children: [
                      Obx(
                        () => BsOpOfferingPricesList(
                          availbleUnits: viewController.newRoomAvaiableUnits(
                              viewController.additionalRooms[index]
                                  ["controller"]),
                          onAddPrice: (TimeUnit unit) {
                            (viewController.additionalRooms[index]["controller"]
                                    as BusinessItemDetailsController)
                                .addPriceTimeUnit(timeUnit: unit);
                          },
                          onRemovePrice: (TimeUnit unit) {
                            (viewController.additionalRooms[index]["controller"]
                                    as BusinessItemDetailsController)
                                .removeTimeUnit(unit);
                          },
                          seletedPrices: (viewController.additionalRooms[index]
                                      ["controller"]
                                  as BusinessItemDetailsController)
                              .priceTimeUnitMap,
                        ),
                      ),
                    ],
                  ),
                  if (viewController.additionalRooms[index]["roomType"]
                          .toString()
                          .toCoWorkingRoomType() !=
                      CoWorkingRoomType.PrivateRoom)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        smallSepartor,
                        Text(
                          "Number of desk",
                          style: context.textTheme.bodyLarge,
                        ),
                        TextField(
                          controller: viewController.additionalRooms[index]
                              ["deskController"],
                          keyboardType: TextInputType.number,
                        ),
                        smallSepartor,
                        Text(
                          "Surface area",
                          style: context.textTheme.bodyLarge,
                        ),
                        TextField(
                          controller: viewController.additionalRooms[index]
                              ["areaController"],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            suffix: Text("Sq ft"),
                          ),
                        ),
                      ],
                    ),
                ],
              );
            },
          ),
        ],
      );
    });
  }
}
