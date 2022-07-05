import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundryAppAppBar.dart';
import 'package:mezcalmos/LaundryApp/pages/CategoryView/controllers/addCategoryController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['CategoryView'];

class LaundryOpCategoryScreen extends StatefulWidget {
  const LaundryOpCategoryScreen({Key? key}) : super(key: key);

  @override
  State<LaundryOpCategoryScreen> createState() =>
      _LaundryOpCategoryScreenState();
}

class _LaundryOpCategoryScreenState extends State<LaundryOpCategoryScreen> {
  /// AddCategoryController
  ///
  AddCategoryController _viewController = AddCategoryController();
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  String? categoryId;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? laundryId;
  @override
  void initState() {
    laundryId = Get.parameters["laundryId"];
    categoryId = Get.parameters["categoryId"];
    mezDbgPrint("Category from admin view ========>$categoryId");

    if (laundryId != null) {
      _viewController.init(categoryId: categoryId, laundryID: laundryId!);
    } else {
      Get.back();
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: _addCategoryAppBar(),
        body: _getRightBody(),
        bottomNavigationBar: _addCategoryFooterButton(),
      ),
    );
  }

  Widget _addCategoryFooterButton() {
    return Container(
      height: 60,
      child: InkWell(
          onTap: () {
            if (_formKey.currentState?.validate() ?? false) {
              _viewController.handleFooterButtonClick();
            }
          },
          child: Ink(
            decoration: BoxDecoration(gradient: bluePurpleGradient),
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                (_viewController.editMode.value)
                    ? "${_i18n()["editCategory"]}"
                    : "${_i18n()["addCategory"]}",
                style: Get.textTheme.bodyText1?.copyWith(color: Colors.white),
              ),
            ),
          )),
    );
  }

  PreferredSizeWidget _addCategoryAppBar() {
    return LaundryAppAppBar(
      leftBtnType: AppBarLeftButtonType.Back,
      onClick: Get.back,
      title: (_viewController.editMode.value)
          ? _viewController.getRightName() ?? ""
          : "${_i18n()["addCategory"]}",
    );
  }

  Widget _getRightBody() {
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
                style: Get.textTheme.bodyText1,
              ),
              const SizedBox(height: 15),
              _categoryNameComponent(
                  controller: _viewController.primaryCategoryNameController),
              if (_viewController.secondaryLang.value != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${_i18n()["categoryNameIn"]} ${_viewController.secondaryLang.value!.toLanguageName() ?? ""} ",
                      style: Get.textTheme.headline4,
                    ),
                    const SizedBox(height: 15),
                    _categoryNameComponent(
                        controller:
                            _viewController.secondaryCategoryNameController),
                  ],
                ),
              const SizedBox(height: 20),
              _categoryPriceComponent(),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _categoryNameComponent(
      {required TextEditingController controller, bool isSecodary = false}) {
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
          style: Get.textTheme.headline4,
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
