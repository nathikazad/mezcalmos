import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/components/ROpAppBar.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/controllers/addCategoryController.dart';
import 'package:mezcalmos/RestaurantApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['CategoryView'];

class ROpCategoryView extends StatefulWidget {
  const ROpCategoryView({Key? key}) : super(key: key);

  static Future<void> navigate({required int restaurantId}) {
    return MezRouter.toPath(
        RestaurantRouter.restaurantCategoryRoute
            .replaceAll(":restaurantId", restaurantId.toString()),
        arguments: <String, dynamic>{"shouldSave": false});
  }

  static Future<void> navigateWithCategory(
      {required int categoryId, required int restaurantId}) {
    return MezRouter.toPath(RestaurantRouter.restaurantEditCategoryRoute
        .replaceAll(":categoryId", categoryId.toString())
        .replaceAll(":restaurantId", restaurantId.toString()));
  }

  @override
  State<ROpCategoryView> createState() => _ROpCategoryViewState();
}

class _ROpCategoryViewState extends State<ROpCategoryView> {
  /// AddCategoryController
  ///
  AddCategoryController _viewController = AddCategoryController();
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  String? _categoryId;
  String? restaurantId;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool shouldSave = true;

  @override
  void initState() {
    _categoryId = MezRouter.urlArguments["categoryId"].toString();
    restaurantId = MezRouter.urlArguments["restaurantId"].toString();
    mezDbgPrint("Restif =======>$restaurantId");
    if (MezRouter.bodyArguments != null) {
      shouldSave = MezRouter.bodyArguments?["shouldSave"].toString() == 'true'
          ? true
          : false;
    }

    if (restaurantId != null) {
      _viewController.init(
          categoryId: _categoryId, restaurantId: restaurantId!);
    }

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
          if (_formKey.currentState?.validate() ?? false) {
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
    return ROpAppBar(
      leftBtnType: AppBarLeftButtonType.Back,
      onClick: MezRouter.back,
      title: (_viewController.editMode.value)
          ? _viewController.category.value?.name![userLanguage]
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
                style: Get.textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              _categoryNameComponent(
                  languageType: _viewController.primaryLang.value!,
                  controller: _viewController.primaryCategoryNameController),
              SizedBox(
                height: 25,
              ),
              Text(
                "${_i18n()["categoryNameIn"]} ${_viewController.secondaryLang.value!.toLanguageName() ?? ""} ",
                style: Get.textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              _categoryNameComponent(
                  languageType: _viewController.secondaryLang.value!,
                  controller: _viewController.secondaryCategoryNameController),
              SizedBox(
                height: 25,
              ),
              Text(
                "${_i18n()["catDesc"]}",
                style: Get.textTheme.bodyLarge,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 7,
                minLines: 3,
                style: Get.textTheme.bodyLarge,
                controller: _viewController.primaryCatDesc,
                decoration: InputDecoration(
                  hintText: '${_i18n()["categoryDescHint"]}',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "${_i18n()["catDescIn"]} ${_viewController.secondaryLang.value!.toLanguageName()}",
                style: Get.textTheme.bodyLarge,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 7,
                minLines: 3,
                style: Get.textTheme.bodyLarge,
                controller: _viewController.secondaryCatDesc,
                decoration: InputDecoration(
                  hintText: '${_i18n()["categoryDescHint"]}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _categoryNameComponent(
      {required TextEditingController controller,
      required LanguageType languageType}) {
    return TextFormField(
      controller: controller,
      style: Get.textTheme.bodyLarge,
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
