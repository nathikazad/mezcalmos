import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

extension RentalHelper on Rental {
  bool get isVehicle => category1 == RentalCategory1.Vehicle;
  bool get isHome => category1 == RentalCategory1.Home;
  bool get isSurf => category1 == RentalCategory1.Surf;
}
