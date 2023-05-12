import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' as fd;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:image_picker/image_picker.dart' as imPicker;
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class BusinessItemDetailsController {
  BusinessItemDetailsController();
  // instances //
  imPicker.ImagePicker _imagePicker = imPicker.ImagePicker();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController scNameController = TextEditingController();
  TextEditingController scDescriptionController = TextEditingController();
  // state variables //
  RxList<String?> imagesUrls = RxList.filled(5, null);

  RxMap<TimeUnit, TextEditingController> priceTimeUnitMap =
      RxMap<TimeUnit, TextEditingController>();
  RxList<File?> images = RxList.filled(5, null);
  RxBool isAvailable = false.obs;
  RxBool isEditing = false.obs;
  Rxn<BusinessItemDetails> _details = Rxn<BusinessItemDetails>();
  Rxn<ServiceProviderLanguage> languages = Rxn();
  // getters //

  BusinessItemDetails? get details => _details.value;
  // methods //
  void setLanguage({required ServiceProviderLanguage language}) {
    languages.value = language;
  }

  Future<void> initEditMode({required int detalsId}) async {
    mezDbgPrint(" 🟢  initEditMode : $detalsId");
    _details.value = await get_business_item_details_by_id(
        detailsId: detalsId,
        businessId: Get.find<BusinessOpAuthController>().companyId!);

    if (details != null) {
      nameController.text = details!.name[languages.value!.primary] ?? "";
      descriptionController.text =
          details!.description?[languages.value!.primary] ?? "";
      scNameController.text = details!.name[languages.value!.secondary] ?? "";
      scDescriptionController.text =
          details!.description?[languages.value!.secondary] ?? "";
      isAvailable.value = details!.available;

      if (details!.image != null) {
        for (int i = 0; i < details!.image!.length; i++) {
          imagesUrls[i] = details!.image![i];
        }
      }
      imagesUrls.refresh();

      details!.cost.forEach((TimeUnit key, num value) {
        TextEditingController _controller = TextEditingController();
        _controller.text = value.toString();
        priceTimeUnitMap[key] = _controller;
      });
    }
  }

  Future<BusinessItemDetails> contructDetails() async {
    List<String> images = await uploadItemsImages();
    // final LanguageMap _name = constructName();
    return BusinessItemDetails(
        id: details?.id ?? 0,
        name: constructName(),
        description: constructDesc(),
        image: images,
        businessId: Get.find<BusinessOpAuthController>().companyId!,
        available: isAvailable.value,
        cost: priceTimeUnitMap.value.map(
            (TimeUnit key, TextEditingController value) =>
                MapEntry(key, double.parse(value.text))));
  }

  Future<void> updateItemDetails() async {
    await Future.wait(
        [_updateName(), _updateDescription(), _pushDetailsToDb()]);
  }

  Future<void> _pushDetailsToDb() async {
    BusinessItemDetails _details = await contructDetails();
    try {
      int? res = await update_business_item_details(
          details: _details, id: _details.id.toInt());
    } on OperationException catch (e) {
      mezDbgPrint(" 🛑  OperationException : ${e.graphqlErrors[0].message}");
    }
  }

  Future<List<String>> uploadItemsImages() async {
    List<String?> _imagesUrls = List<String?>.from(imagesUrls);

    for (int i = 0; i < images.length; i++) {
      if (images[i] != null) {
        _imagesUrls[i] = await uploadImgToFbStorage(
            imageFile: imPicker.XFile(images[i]!.path),
            storageFolder:
                "businesses/${Get.find<BusinessOpAuthController>().companyId}/items/${DateTime.now().millisecondsSinceEpoch}");
      }
    }
    List<String> data = _imagesUrls
        .where((String? element) => element != null)
        .map((String? e) => e!)
        .toList();
    return data;
  }

  Future<int?> _updateDescription() async {
    int? descId;
    if (!fd.mapEquals(details?.description, constructDesc())) {
      if (details?.descriptionId != null) {
        constructDesc().forEach((Language key, String value) {
          update_translation(
              langType: key,
              value: value,
              translationId: details!.descriptionId!.toInt());
        });
        return details!.descriptionId!.toInt();
      } else {
        descId = await insert_translation(
            translation: constructDesc(),
            serviceType: ServiceProviderType.Business,
            serviceId: details!.businessId.toInt());
        return descId;
        // }
      }
    }
    return null;
  }

  Future<void> _updateName() async {
    if (!fd.mapEquals(details?.name, constructName())) {
      constructName().forEach((Language key, String value) {
        update_translation(
            langType: key,
            value: value,
            translationId: details!.nameId!.toInt());
      });
    }
  }

  void addPriceTimeUnit({
    required TimeUnit timeUnit,
  }) {
    TextEditingController textEditingController = TextEditingController();
    priceTimeUnitMap[timeUnit] = textEditingController;
    // priceTimeUnitMap.refresh();
  }

  void removeTimeUnit(TimeUnit timeUnit) {
    priceTimeUnitMap.removeWhere(
        (TimeUnit key, TextEditingController value) => key == timeUnit);
  }

  void clearPrices() => priceTimeUnitMap.clear();

  Future<void> addItemImage(
      {required int itemIndex, required BuildContext context}) async {
    final imPicker.ImageSource? _from = await imagePickerChoiceDialog(context);

    if (_from != null) {
      final imPicker.XFile? _res =
          await imagePicker(picker: _imagePicker, source: _from);

      try {
        if (_res != null) {
          images[itemIndex] = File(_res.path);
        }
      } catch (e) {
        mezDbgPrint(
            "[+] MEZEXCEPTION => ERROR HAPPEND WHILE BROWING - SELECTING THE IMAGE !\nMore Details :\n$e ");
      }
    }
  }

  ImageProvider? getImage(int index) {
    if (images[index] != null) {
      return FileImage(images[index]!);
    } else if (imagesUrls[index] != null) {
      return CachedNetworkImageProvider(imagesUrls[index]!);
    }
    return null;
  }

  LanguageMap constructDesc() {
    final LanguageMap _desc = {
      languages.value!.primary: descriptionController.text
    };
    if (languages.value!.secondary != null) {
      _desc[languages.value!.secondary!] = scDescriptionController.text;
    }
    return _desc;
  }

  LanguageMap constructName() {
    final LanguageMap _name = {languages.value!.primary: nameController.text};
    if (languages.value!.secondary != null) {
      _name[languages.value!.secondary!] = scNameController.text;
    }
    return _name;
  }

  bool get hasOneImage {
    return imagesUrls.any((String? element) => element != null) ||
        images.any((File? element) => element != null);
  }
}
