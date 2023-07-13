import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/controllers/BsServicesListViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

enum OtherServiceType {
  Class,
  Event,
  Rental,
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
  Rxn<OtherServiceItems> selectedServiceType = Rxn<OtherServiceItems>();
  RxList<OtherCategoryItems> selectedCategory = RxList<OtherCategoryItems>();
  Rxn<OtherCategoryItems> selectedCategoryItem = Rxn<OtherCategoryItems>();

  void init(
    OtherServiceType profileName,
    BsServicesListViewController controller,
  ) {
    this.controller = controller;
    possibleServiceTypeMap = {
      OtherServiceType.Class: OtherServiceItems(
        type: OtherServiceType.Class,
        title: "class",
        category: [
          OtherCategoryItems(
            title: "surf",
            navigate: () => _navigateToClass(EventCategory1.Surf),
          ),
          OtherCategoryItems(
            title: "yoga",
            navigate: () => _navigateToClass(EventCategory1.Yoga),
          ),
          OtherCategoryItems(
            title: "language",
            navigate: () => _navigateToClass(EventCategory1.LanguageSchool),
          ),
          OtherCategoryItems(
            title: "uncategorized",
            navigate: () => _navigateToClass(EventCategory1.Uncategorized),
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
            navigate: () => _navigateToEvent(EventCategory1.Therapy),
          ),
          OtherCategoryItems(
            title: "yoga",
            navigate: () => _navigateToEvent(EventCategory1.Yoga),
          ),
          OtherCategoryItems(
            title: "surf",
            navigate: () => _navigateToEvent(EventCategory1.Surf),
          ),
          OtherCategoryItems(
            title: "volunteer",
            navigate: () => _navigateToEvent(EventCategory1.Volunteer),
          ),
          OtherCategoryItems(
            title: "adventure",
            navigate: () => _navigateToEvent(EventCategory1.Adventure),
          ),
          OtherCategoryItems(
            title: "social",
            navigate: () => _navigateToEvent(EventCategory1.Social),
          ),
          OtherCategoryItems(
            title: "dance",
            navigate: () => _navigateToEvent(EventCategory1.Dance),
          ),
          OtherCategoryItems(
            title: "language",
            navigate: () => _navigateToEvent(EventCategory1.LanguageSchool),
          ),
          OtherCategoryItems(
            title: "uncategorized",
            navigate: () => _navigateToEvent(EventCategory1.Uncategorized),
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
            title: "home",
            navigate: () => _navigateToHomeRental(),
          ),
          OtherCategoryItems(
            title: "vehicle",
            navigate: () =>
                _navigateToRental(rentalCategory: RentalCategory1.Vehicle),
          ),
          OtherCategoryItems(
            title: "coWorking",
            navigate: () => _navigateToCoWorking(),
          ),
        ],
        subTitle: "rentalSub",
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
    selectedServiceType.value = possibleServiceTypeMap.entries.first.value;
    selectedCategory.value =
        possibleServiceTypeMap.entries.first.value.category;
    selectedCategoryItem.value =
        possibleServiceTypeMap.entries.first.value.category.first;
  }

  void _navigateToClass(EventCategory1 eventCategory) {
    controller.navigateToEvent(isClass: true, eventCategory: eventCategory);
  }

  void _navigateToEvent(EventCategory1 eventCategory) {
    controller.navigateToEvent(isClass: false, eventCategory: eventCategory);
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

  void _navigateToCoWorking() {
    controller.navigateToCoWorking();
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
