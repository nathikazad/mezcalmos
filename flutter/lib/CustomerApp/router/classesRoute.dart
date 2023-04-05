import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:mezcalmos/CustomerApp/pages/AllServices/Services/ClassesService/ClassesServiceView.dart'
    deferred as classesView;

class ClassesRoutes {
  static String classesViewRoute = "/classes";

  final List<QRoute> routes = [
    QRoute(
        name: classesViewRoute,
        path: classesViewRoute,
        builder: () => classesView.ClassesServiceView(),
        middleware: <QMiddleware>[
          DefferedLoader(classesView.loadLibrary),
        ]),
  ];
}
