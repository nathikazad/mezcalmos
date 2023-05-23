import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Period.dart';

extension EventHelper on Event {
  PeriodOfTime? get period {
    if (startsAt != null && endsAt != null) {
      return PeriodOfTime(
          start: DateTime.parse(startsAt!), end: DateTime.parse(endsAt!));
    }
    return null;
  }

  bool get isClass => tags?.contains(EventTag.Class) == true;
  bool get isAdventure => category1 == EventCategory1.Adventure;
  bool get isTherapy => category1 == EventCategory1.Therapy;
}

extension EventCardHelper on EventCard {
  bool get isAdventure => category1 == EventCategory1.Adventure;
  bool get isTherapy => category1 == EventCategory1.Therapy;
}
