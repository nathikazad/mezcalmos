import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';

class LanguageTabsController {
  late int serviceDetailsId;
  // LanguageTabsController({});

  ServiceProviderLanguage? _language;
  TabController? _tabController;

  Language? get primaryLang => _language?.primary;
  Language? get secondaryLang => _language?.secondary;
  GlobalKey<FormState> primaryLangFormKey = GlobalKey<FormState>();
  GlobalKey<FormState>? secondaryLangFormKey;
  // getters //
  ServiceProviderLanguage? get language => _language;
  TabController? get tabController => _tabController;
  bool get hasSecondaryLang => _language?.secondary != null;
  bool get isOnFirstTab => tabController?.index == 0;

  bool get isOnSecondTab => tabController?.index == 1;

  // vars //
  bool firstFormValid = false;
  bool secondFormValid = false;
  // methods //
  Future<void> init(
      {required TickerProvider vsync, required int detailsId}) async {
    serviceDetailsId = detailsId;
    _language = await get_service_lang(detailsId: serviceDetailsId);
    if (_language != null) {
      _tabController = TabController(length: _length, vsync: vsync);
      secondaryLangFormKey =
          (_language!.secondary != null) ? GlobalKey<FormState>() : null;
    } else
      throw StateError("🔴🔴🔴 Language is null🔴🔴🔴");
  }
  // forms validation methods //

  bool validate() {
    if (isOnFirstTab) {
      // validate first tab
      firstFormValid = _isFirstFormValid;
      if (firstFormValid && !secondFormValid) {
        tabController?.animateTo(1);
      }
    }
    // second tab
    else {
      secondFormValid = _isSecondFormValid;
      if (secondFormValid && !firstFormValid) {
        tabController?.animateTo(0);
      }
    }
    if (secondFormValid && firstFormValid) {
      tabController?.animateTo(0);
    }
    return secondFormValid && firstFormValid;
  }

  bool get _isFirstFormValid {
    return primaryLangFormKey.currentState?.validate() == true;
  }

  bool get _isSecondFormValid {
    return secondaryLangFormKey?.currentState?.validate() == true;
  }

  bool get isBothFormValid {
    return _isFirstFormValid && _isSecondFormValid;
  }

  int get _length {
    int length = 1;
    if (_language != null && _language?.secondary != null) {
      length += 1;
    }
    return length;
  }

  void dispose() {
    tabController?.dispose();
  }
}
