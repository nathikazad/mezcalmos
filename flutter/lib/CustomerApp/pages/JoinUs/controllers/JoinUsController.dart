import 'package:flutter/foundation.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ExternalAppLauncher.dart';

class JoinUsController {
  static const String _mezBizPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.mezcalmos.business';
  static const String _mezBizAppStoreUrl =
      'https://apps.apple.com/us/app/mezbiz/id6449599033';

  static const String _mezDeliveryPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.mezcalmos.delivery';
  static const String _mezDeliveryAppStoreUrl =
      'https://play.google.com/store/apps/details?id=com.mezcalmos.delivery';

  static const String _mezChefPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.mezcalmos.restaurant';
  static const String _mezChefAppStoreUrl =
      'https://apps.apple.com/us/app/mezchef/id6443621484';

  static const String _mezLaundryPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.mezcalmos.laundry';
  static const String _mezLaundryAppStoreUrl =
      'https://play.google.com/store/apps/details?id=com.mezcalmos.business';

  final Map<String, Map<String, String>> options = {
    'restaurantBusiness': {
      'packageName': 'Mezchef',
      'playStoreUrl': _mezChefPlayStoreUrl,
      'appStoreUrl': _mezChefAppStoreUrl,
      'imageUrl': aHouseRentalAgency
    },
    'deliveryDriver': {
      'packageName': 'Mezdelivery',
      'playStoreUrl': _mezDeliveryPlayStoreUrl,
      'appStoreUrl': _mezDeliveryAppStoreUrl,
      'imageUrl': aDelivery
    },
    'laundryBusiness': {
      'packageName': 'Mezlaundry',
      'playStoreUrl': _mezLaundryPlayStoreUrl,
      'appStoreUrl': _mezLaundryAppStoreUrl,
      'imageUrl': aLaundryBusiness
    },
    'houseRentalAgency': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aRestaurantBusiness
    },
    'surfShop': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aSurf
    },
    'vehicleRental': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aVehicle
    },
    'yogaStudio': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aYoga
    },
    'wellnessPractitioner': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aChakras
    },
    'entertainmentEvent': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aDiscoBall
    },
    'volunteerOrganisations': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aVolunteering
    },
    'tourismAgency': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aTourismAgency
    },
    'mealPlanning': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aMealPlanning
    },
    'tattooArtist': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aTattoo
    },
    'beautySalon': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aBeauty
    },
    'photographer': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aPhotography
    },
    'cleaningService': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aCleaning
    },
    'petSitter': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aPetSitting
    },
    'artisanal Products': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aArt
    },
    'realEstate': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aRealEstate
    },
    'languageSchool': {
      'packageName': 'Mezbiz',
      'playStoreUrl': _mezBizPlayStoreUrl,
      'appStoreUrl': _mezBizAppStoreUrl,
      'imageUrl': aLanguageSchool
    }
  };

  Future<void> launchApp(String key) async {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      await ExternalAppLauncher.launchApp(options[key]!['appStoreUrl']!);
    } else {
      await ExternalAppLauncher.launchApp(options[key]!['playStoreUrl']!);
    }
  }
}
