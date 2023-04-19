import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

extension EventListtHelper on List<EventCard> {
  List<EventCard> searchByName(String search) {
    if (search.length > 2) {
      return where((EventCard event) => event.details.name[userLanguage]!
          .toLowerCase()
          .contains(search.toLowerCase())).toList();
    } else
      return this;
  }

  List<EventCard> filterByCategory(List<EventCategory1> categories) {
    return where((EventCard event) => categories.contains(event.category1))
        .toList();
  }
}

extension RentalListtHelper on List<RentalCard> {
  List<RentalCard> searchByName(String search) {
    mezDbgPrint(" searchByName: $search");
    if (search.length > 2) {
      return where((RentalCard event) => event.details.name[userLanguage]!
          .toLowerCase()
          .contains(search.toLowerCase())).toList();
    } else
      return this;
  }

  List<RentalCard> filterByCategory(List<RentalCategory2> categories) {
    return where((RentalCard event) => categories.contains(event.category1))
        .toList();
  }
}

extension BusinessesListtHelper on List<BusinessCard> {
  List<BusinessCard> searchByName(String search) {
    if (search.length > 2) {
      return where((BusinessCard event) =>
          event.name.toLowerCase().contains(search.toLowerCase())).toList();
    } else
      return this;
  }
}
