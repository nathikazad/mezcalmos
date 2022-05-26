import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundryAppAppBar.dart';
import 'package:mezcalmos/LaundryApp/pages/CategoryView/controllers/addCategoryController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
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
  AddCategoryController _addCategoryController = AddCategoryController();
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  String? categoryName;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    categoryName = Get.parameters["categoryId"];

    _addCategoryController.init(categoryId: categoryName);

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
    return Container(
      height: 60,
      child: InkWell(
          onTap: () {
            if (_formKey.currentState?.validate() ?? false) {
              _addCategoryController.handleFooterButtonClick();
            }
          },
          child: Ink(
            decoration: BoxDecoration(gradient: bluePurpleGradient),
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                (_addCategoryController.editMode.value)
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
      title: (_addCategoryController.editMode.value)
          ? _addCategoryController.copyOfCategory.value!.name[userLanguage]!
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
              Text(
                "${_i18n()["categoryName"]}",
                style: Get.textTheme.headline4,
              ),
              const SizedBox(height: 8),
              _categoryNameComponent(
                  controller:
                      _addCategoryController.primaryCategoryNameController),
              if (_addCategoryController.secondaryLang.value != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${_i18n()["categoryNameIn"]} ${_addCategoryController.secondaryLang.value!.toLanguageName() ?? ""} ",
                      style: Get.textTheme.headline4,
                    ),
                    const SizedBox(height: 8),
                    _categoryNameComponent(
                        controller: _addCategoryController
                            .secondaryCategoryNameController),
                  ],
                ),
              const SizedBox(height: 16),
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
          return "Please add a category name";
        }
      },
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        hintText: '${_i18n()["categoryNameHint"]}',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
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
          controller: _addCategoryController.categoryPricingController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (String? v) {
            if (v != null && v.isNotEmpty && int.tryParse(v) != null) {
              return null;
            } else {
              return "Please add a correct price ";
            }
          },
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            hintText: '${_i18n()["categoryPriceHint"]}',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
