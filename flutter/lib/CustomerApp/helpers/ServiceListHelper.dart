import 'package:mezcalmos/Shared/models/Services/Service.dart';

extension RestaurantFilters<T extends Service> on List<Service> {
  List<Service> searchByName(String search) {
    return where((Service restaurant) =>
            restaurant.info.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  List<Service> showOnlyOpen(bool value) {
    if (value == true) {
      return where((Service restaurant) => restaurant.isOpen() == true)
          .toList();
    } else {
      return where(
              (Service restaurant) => restaurant.state.isClosedIndef == false)
          .toList();
    }
  }

  void sortByOpen() {
    sort((Service a, Service b) {
      if (a.isOpen() && !b.isOpen()) {
        return -1;
      } else if (!a.isOpen() && b.isOpen()) {
        return 1;
      } else
        return 0;
    });
  }
}
