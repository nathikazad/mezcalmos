import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/Components/LaundryAppAppBar.dart';
import 'package:mezcalmos/RestaurantApp/pages/CategoryView/controllers/addCategoryController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['CategoryView'];

class ROpCategoryView extends StatefulWidget {
  const ROpCategoryView({Key? key}) : super(key: key);

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _categoryId = Get.parameters["categoryId"];

    _viewController.init(categoryId: _categoryId);

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
              _viewController.saveCategory();
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
          ? _viewController.category.value!.name![userLanguage]
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
                  controller: _viewController.primaryCategoryNameController),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${_i18n()["categoryNameIn"]} ${_viewController.secondaryLang.value!.toLanguageName() ?? ""} ",
                    style: Get.textTheme.headline4,
                  ),
                  const SizedBox(height: 8),
                  _categoryNameComponent(
                      controller:
                          _viewController.secondaryCategoryNameController),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Category Description",
                style: Get.textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 7,
                minLines: 3,
                controller: _viewController.primaryCatDesc,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '${_i18n()["categoryNameHint"]}',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Category Description in ${_viewController.secondaryLang.value!.toLanguageName()}",
                style: Get.textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 7,
                minLines: 3,
                controller: _viewController.secondaryCatDesc,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '${_i18n()["categoryNameHint"]}',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
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
}
