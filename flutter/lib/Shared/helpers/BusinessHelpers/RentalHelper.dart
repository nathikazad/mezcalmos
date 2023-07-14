import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

extension RentalHelper on Rental {
  bool get isVehicle => category1 == RentalCategory1.Vehicle;
  // bool get isHome => category1 == RentalCategory1.Home;
  bool get isSurf => category1 == RentalCategory1.Surf;
}

extension HomeHelper on Home {
  bool get forRent => availableFor == HomeAvailabilityOption.Rent;
  bool get forSale => availableFor == HomeAvailabilityOption.Sale;
  bool get isOfficeSpace =>
      details.additionalParameters != null &&
      details.additionalParameters!.containsKey("roomType1") &&
      CoWorkingRoomType.values
          .map((e) => e.toFirebaseFormatString())
          .contains(details.additionalParameters?["roomType1"].toString());
}

enum RoomType { SingleBed, DoubleBed, DormRoom, Suite }

extension ParseRoomTypeToString on RoomType {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToRoomType on String {
  RoomType toRoomType() {
    return RoomType.values.firstWhere((RoomType roomType) =>
        roomType.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}

enum CoWorkingRoomType { FullFloorOffice, PrivateRoom, DedicatedDesk }

extension ParseCoWorkingRoomTypeToString on CoWorkingRoomType {
  String toFirebaseFormatString() {
    String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToCoWorkingRoomType on String {
  CoWorkingRoomType toCoWorkingRoomType() {
    return CoWorkingRoomType.values.firstWhere((CoWorkingRoomType roomType) =>
        roomType.toFirebaseFormatString().toLowerCase() == toLowerCase());
  }
}
