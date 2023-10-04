import 'package:mezcalmos/InfluencerApp/pages/InfTabsView.dart';
import 'package:mezcalmos/InfluencerApp/pages/InfluencerWrapper.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class InfluencerAppRoutes {
  static const String tabsView = "/tabs";
  static final List<QRoute> mainRoutes = <QRoute>[
        QRoute(
          path: SharedRoutes.kHomeRoute,
          name: SharedRoutes.kHomeRoute,
          builder: () => InfluencerWrapper(),
        ),
        QRoute(
          path: tabsView,
          name: tabsView,
          builder: () => InfTabsView(),
        ),
      ] +
      SharedRoutes.qRoutes +
      NativeOnlyRoutes.routes;
}
