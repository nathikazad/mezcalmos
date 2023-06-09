import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/controllers/BsServicesListViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

enum OtherServiceType {
  Class,
  Event,
  Rental,
  HomeRental,
  Service,
  Item,
}

class OtherServiceItems {
  OtherServiceType type;
  String title;
  String subTitle;
  List<OtherCategoryItems> category;
  OtherServiceItems({
    required this.type,
    required this.title,
    required this.category,
    required this.subTitle,
  });
}

class OtherCategoryItems {
  String title;
  Function navigate;
  OtherCategoryItems({
    required this.title,
    required this.navigate,
  });
}

class BsOtherServiceViewController {
  late BsServicesListViewController controller;
  Map<OtherServiceType, OtherServiceItems> possibleServiceTypeMap = {};
  Map<OtherServiceType, OtherServiceItems> _allServiceTypeMap = {};
  Rxn<OtherServiceItems> selectedServiceType = Rxn<OtherServiceItems>();
  RxList<OtherCategoryItems> selectedCategory = RxList<OtherCategoryItems>();
  Rxn<OtherCategoryItems> selectedCategoryItem = Rxn<OtherCategoryItems>();

  void init(
    OtherServiceType profileName,
    BsServicesListViewController controller,
  ) {
    this.controller = controller;
    _allServiceTypeMap = {
      OtherServiceType.Class: OtherServiceItems(
        type: OtherServiceType.Class,
        title: "class",
        category: [
          OtherCategoryItems(
            title: "surf",
            navigate: () => _navigateToClass(),
          ),
          OtherCategoryItems(
            title: "yoga",
            navigate: () => _navigateToClass(),
          ),
          OtherCategoryItems(
            title: "language",
            navigate: () => _navigateToClass(),
          ),
          OtherCategoryItems(
            title: "uncategorized",
            navigate: () => _navigateToClass(),
          ),
        ],
        subTitle: "classSub",
      ),
      OtherServiceType.Event: OtherServiceItems(
        type: OtherServiceType.Event,
        title: "event",
        category: [
          OtherCategoryItems(
            title: "therapy",
            navigate: () => _navigateToEvent(),
          ),
          OtherCategoryItems(
            title: "yoga",
            navigate: () => _navigateToEvent(),
          ),
          OtherCategoryItems(
            title: "surf",
            navigate: () => _navigateToEvent(),
          ),
          OtherCategoryItems(
            title: "volunteer",
            navigate: () => _navigateToEvent(),
          ),
          OtherCategoryItems(
            title: "adventure",
            navigate: () => _navigateToEvent(),
          ),
          OtherCategoryItems(
            title: "social",
            navigate: () => _navigateToEvent(),
          ),
          OtherCategoryItems(
            title: "dance",
            navigate: () => _navigateToEvent(),
          ),
          OtherCategoryItems(
            title: "language",
            navigate: () => _navigateToEvent(),
          ),
          OtherCategoryItems(
            title: "uncategorized",
            navigate: () => _navigateToEvent(),
          ),
        ],
        subTitle: "eventSub",
      ),
      OtherServiceType.Rental: OtherServiceItems(
        type: OtherServiceType.Rental,
        title: "rental",
        category: [
          OtherCategoryItems(
            title: "surf",
            navigate: () =>
                _navigateToRental(rentalCategory: RentalCategory1.Surf),
          ),
          OtherCategoryItems(
            title: "vehicle",
            navigate: () =>
                _navigateToRental(rentalCategory: RentalCategory1.Vehicle),
          ),
        ],
        subTitle: "rentalSub",
      ),
      OtherServiceType.HomeRental: OtherServiceItems(
        type: OtherServiceType.HomeRental,
        title: "home",
        category: [
          OtherCategoryItems(
            title: "home",
            navigate: () => _navigateToHomeRental(),
          ),
        ],
        subTitle: "homeSub",
      ),
      OtherServiceType.Service: OtherServiceItems(
        type: OtherServiceType.Service,
        title: "service",
        category: [
          OtherCategoryItems(
            title: "cleaning",
            navigate: () =>
                _navigateToSerice(serviceCategory: ServiceCategory1.Cleaning),
          ),
          OtherCategoryItems(
            title: "petSitting",
            navigate: () =>
                _navigateToSerice(serviceCategory: ServiceCategory1.PetSitting),
          ),
          OtherCategoryItems(
            title: "mealPlanning",
            navigate: () => _navigateToSerice(
                serviceCategory: ServiceCategory1.MealPlanning),
          ),
        ],
        subTitle: "serviceSub",
      ),
      OtherServiceType.Item: OtherServiceItems(
        type: OtherServiceType.Item,
        title: "item",
        category: [
          OtherCategoryItems(
            title: "personalCare",
            navigate: () => _navigateToProduct(),
          ),
          OtherCategoryItems(
            title: "art",
            navigate: () => _navigateToProduct(),
          ),
          OtherCategoryItems(
            title: "consumable",
            navigate: () => _navigateToProduct(),
          ),
        ],
        subTitle: "itemSub",
      ),
    };
    possibleServiceTypeMap = {..._allServiceTypeMap};
    possibleServiceTypeMap.remove(profileName);
    selectedServiceType.value = possibleServiceTypeMap.entries.first.value;
    selectedCategory.value =
        possibleServiceTypeMap.entries.first.value.category;
    selectedCategoryItem.value =
        possibleServiceTypeMap.entries.first.value.category.first;
  }

  void _navigateToClass() {
    controller.navigateToEvent(isClass: true);
  }

  void _navigateToEvent() {
    controller.navigateToEvent(isClass: false);
  }

  void _navigateToRental({required RentalCategory1 rentalCategory}) {
    controller.navigateToRental(rentalCategory: rentalCategory);
  }

  void _navigateToHomeRental() {
    controller.navigateToHomeRental();
  }

  void _navigateToSerice({required ServiceCategory1 serviceCategory}) {
    controller.navigateToService(serviceCategory: serviceCategory);
  }

  void _navigateToProduct() {
    controller.navigateToProduct();
  }

  void changeServiceStype(OtherServiceItems serviceType) {
    selectedServiceType.value = serviceType;
    selectedCategory.value = serviceType.category;
    selectedCategoryItem.value = serviceType.category.first;
  }

  void changeCategory(OtherCategoryItems category) {
    selectedCategoryItem.value = category;
  }

  Future<void> navigate() async {
    if (selectedCategoryItem.value == null) return;
    selectedCategoryItem.value?.navigate();
  }
}
