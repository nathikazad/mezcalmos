import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/LaundryCategoryView/controllers/LaundrOpCategoryViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['CategoryView'];

class LaundrOpCategoryView extends StatefulWidget {
  const LaundrOpCategoryView({Key? key}) : super(key: key);

  @override
  State<LaundrOpCategoryView> createState() => _LaundrOpCategoryViewState();
}

class _LaundrOpCategoryViewState extends State<LaundrOpCategoryView> {
  /// AddCategoryController
  ///
  LaundrOpCategoryViewController _viewController =
      LaundrOpCategoryViewController();

  int? categoryId;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int? laundryId;
  @override
  void initState() {
    laundryId = int.tryParse(Get.parameters["laundryId"]!);
    if (Get.parameters["categoryId"] != null) {
      categoryId = int.tryParse(Get.parameters["categoryId"]!);
    }

    if (laundryId != null) {
      _viewController.init(categoryId: categoryId, laundryID: laundryId!);
    } else {
      MezRouter.back();
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _addCategoryAppBar(),
      body: _getRightBody(),
      bottomNavigationBar: _addCategoryFooterButton(),
    );
  }

  Widget _addCategoryFooterButton() {
    return MezButton(
      borderRadius: 0,
      height: 70,
      label: "${_i18n()["saveCategory"]}",
      onClick: () async {
        if (_formKey.currentState?.validate() ?? false) {
          await _viewController.handleFooterButtonClick();
        }
      },
    );
  }

  PreferredSizeWidget _addCategoryAppBar() {
    return MezcalmosAppBar(
      AppBarLeftButtonType.Back,
      onClick: () {
        MezRouter.back(result: _viewController.shouldRefetch);
      },
      titleWidget: Obx(
        () => Text((_viewController.editMode.value &&
                _viewController.copyOfCategory.value != null)
            ? _viewController.copyOfCategory.value!.name[userLanguage] ?? ""
            : "${_i18n()["addCategory"]}"),
      ),
    );
  }

  Widget _getRightBody() {
    return Obx(
      () {
        if (_viewController.hasData) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    Text(
                      "${_i18n()["categoryName"]}",
                      style: Get.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 15),
                    _categoryNameComponent(
                        controller:
                            _viewController.primaryCategoryNameController),
                    if (_viewController.secondaryLang.value != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${_i18n()["categoryNameIn"]} ${_viewController.secondaryLang.value!.toLanguageName() ?? ""} ",
                            style: Get.textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 15),
                          _categoryNameComponent(
                              controller: _viewController
                                  .secondaryCategoryNameController),
                        ],
                      ),
                    const SizedBox(height: 20),
                    _categoryPriceComponent(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  TextFormField _categoryNameComponent(
      {required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (String? v) {
        if (v != null && v.isNotEmpty) {
          return null;
        } else {
          return "${_i18n()["categoryNameError"]}";
        }
      },
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: '${_i18n()["categoryNameHint"]}',
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8))),
    );
  }

  Widget _categoryPriceComponent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${_i18n()["categoryPrice"]}",
          style: Get.textTheme.bodyLarge,
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _viewController.categoryPricingController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (String? v) {
            if (v != null && v.isNotEmpty && int.tryParse(v) != null) {
              return null;
            } else {
              return "${_i18n()["categoryPriceError"]}";
            }
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              hintText: '${_i18n()["categoryPriceHint"]}',
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8))),
        ),
      ],
    );
  }
}
