import 'package:mezcalmos/CustomerApp/pages/CustCardsListView/CustCardsListView.dart'
    deferred as savedCard;
import 'package:qlevar_router/qlevar_router.dart';

class SavedCardRoutes {
  static const String savedCards = '/savedCards';

  final routes = QRoute(
      path: savedCards,
      name: savedCards,
      builder: () => savedCard.CustCardsListView());
}
