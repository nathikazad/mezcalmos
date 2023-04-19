import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class CustRentalWrapper extends StatefulWidget {
  const CustRentalWrapper({super.key});
  static Future<void> navigate() {
    final String route = CustBusinessRoutes.custEventsListRoute;
    return MezRouter.toPath(route);
  }

  @override
  State<CustRentalWrapper> createState() => _CustRentalWrapperState();
}

class _CustRentalWrapperState extends State<CustRentalWrapper> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
