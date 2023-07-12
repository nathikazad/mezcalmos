import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

extension RentalHelper on Rental {
  bool get isVehicle => category1 == RentalCategory1.Vehicle;
  // bool get isHome => category1 == RentalCategory1.Home;
  bool get isSurf => category1 == RentalCategory1.Surf;
}

extension HomeHelper on Home {
  bool get forRent => availableFor == HomeAvailabilityOption.Rent;
  bool get forSale => availableFor == HomeAvailabilityOption.Sale;
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
