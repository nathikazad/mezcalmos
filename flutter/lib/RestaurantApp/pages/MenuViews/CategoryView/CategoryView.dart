import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/controllers/addCategoryController.dart';
import 'package:mezcalmos/RestaurantApp/router/router.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['CategoryView'];

class ROpCategoryView extends StatefulWidget {
  const ROpCategoryView({Key? key}) : super(key: key);

  static Future<void> navigate(
      {required int restaurantId, required int detailsId,bool saveToDb = false}) {
    return MezRouter.toPath(
        RestaurantAppRoutes.restaurantCategoryRoute
            .replaceAll(":restaurantId", restaurantId.toString()),
        arguments: <String, dynamic>{"shouldSave": saveToDb,"detailsId" : detailsId});
  }



  @override
  State<ROpCategoryView> createState() => _ROpCategoryViewState();
}

class _ROpCategoryViewState extends State<ROpCategoryView>
    with TickerProviderStateMixin {
  /// AddCategoryController
  ///
  AddCategoryController _viewController = AddCategoryController();
  final Language userLanguage = Get.find<LanguageController>().userLanguageKey;
  String? _categoryId;
  String? restaurantId;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool shouldSave = true;
  int? detailsId;

  @override
  void initState() {
    _categoryId = MezRouter.urlArguments["categoryId"].toString();
    restaurantId = MezRouter.urlArguments["restaurantId"].toString();
    mezDbgPrint("Restif =======>${MezRouter.bodyArguments}");
    if (MezRouter.bodyArguments != null) {
      shouldSave = MezRouter.bodyArguments?["shouldSave"].toString() == 'true'
          ? true
          : false;
    }

    shouldSave = MezRouter.bodyArguments!["shouldSave"] as bool;
    detailsId = int.tryParse(MezRouter.bodyArguments!["detailsId"].toString());

    if (restaurantId != null && detailsId != null) {
      _viewController.init(
          categoryId: _categoryId,
          restaurantId: restaurantId!,
          detailsId: detailsId!,
          vsync: this);
    } else
      showErrorSnackBar();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_viewController.isLoading) {
        return Scaffold(
          appBar: _addCategoryAppBar(),
          body: _getRightBody(),
          bottomNavigationBar: _addCategoryFooterButton(),
        );
      } else {
        return Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: MezLogoAnimation(centered: true),
        );
      }
    });
  }

  Widget _addCategoryFooterButton() {
    return MezButton(
        withGradient: true,
        borderRadius: 0,
        height: 70,
        onClick: () async {
          if (_formKey.currentState?.validate() == true) {
            if (shouldSave) {
              final bool hasSaved = await _viewController.saveCategory();
              if (hasSaved) {
                await MezRouter.back(backResult: true);
              }
            } else {
              await MezRouter.back(
                  backResult: _viewController.constructCategory());
            }
          }
        },
        label: (_viewController.editMode.isFalse)
            ? "${_i18n()["addCategory"]}"
            : "${_i18n()["editCategory"]}");
  }

  PreferredSizeWidget _addCategoryAppBar() {
    return MezcalmosAppBar(
      AppBarLeftButtonType.Back,
      onClick: MezRouter.back,
      title: (_viewController.editMode.value)
          ? _viewController.category.value?.name!.getTranslation(userLanguage)
          : "${_i18n()["addCategory"]}",
    );
  }

  Widget _getRightBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 8),
              Text(
                "${_i18n()["categoryName"]}",
                style: context.txt.bodyLarge,
              ),
              const SizedBox(height: 10),
              _categoryNameComponent(
                  languageType: _viewController.languages!.primary,
                  controller: _viewController.primaryCategoryNameController),
              if (_viewController.hasSecondaryLang) ...[
                SizedBox(
                  height: 25,
                ),
                Text(
                  "${_i18n()["categoryNameIn"]} ${_viewController.languages!.secondary?.toLanguageName() ?? ""} ",
                  style: context.txt.bodyLarge,
                ),
                const SizedBox(height: 10),
                _categoryNameComponent(
                    languageType: _viewController.languages!.secondary!,
                    controller:
                        _viewController.secondaryCategoryNameController),
              ],
              SizedBox(
                height: 25,
              ),
              Text(
                "${_i18n()["catDesc"]}",
                style: context.txt.bodyLarge,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 7,
                minLines: 3,
                style: context.txt.bodyLarge,
                controller: _viewController.primaryCatDesc,
                decoration: InputDecoration(
                  hintText: '${_i18n()["categoryDescHint"]}',
                ),
              ),
              if (_viewController.hasSecondaryLang) ...[
                SizedBox(
                  height: 25,
                ),
                Text(
                  "${_i18n()["catDescIn"]} ${_viewController.languages!.secondary?.toLanguageName() ?? ""}",
                  style: context.txt.bodyLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 7,
                  minLines: 3,
                  style: context.txt.bodyLarge,
                  controller: _viewController.secondaryCatDesc,
                  decoration: InputDecoration(
                    hintText: '${_i18n()["categoryDescHint"]}',
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _categoryNameComponent(
      {required TextEditingController controller,
      required Language languageType}) {
    return TextFormField(
      controller: controller,
      style: context.txt.bodyLarge,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (String? v) {
        mezDbgPrint(v?.trim().toLowerCase());
        if (v != null &&
            v.isNotEmpty &&
            !_viewController
                .getCatNames(languageType)
                .contains(v.toLowerCase())) {
          return null;
        } else if (_viewController
            .getCatNames(languageType)
            .contains(v?.toLowerCase())) {
          return '${_i18n()["nameExist"]}';
        } else {
          return "${_i18n()["categoryNameError"]}";
        }
      },
      decoration: InputDecoration(
        hintText: '${_i18n()["categoryNameHint"]}',
      ),
    );
  }
}
