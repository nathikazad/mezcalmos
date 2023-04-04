import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class MRoute {
  String name;

  Completer<void> completer;
  Map<String, dynamic>? arguments;
  Function? returnToViewCallback;
  MRoute({required this.name, this.arguments, required this.completer});
}

class MezRouter {
  static final List<MRoute> _navigationStack = <MRoute>[
    MRoute(name: SharedRoutes.kWrapperRoute, completer: Completer<void>())
  ];
  static Map<String, dynamic>? _arguments;
  static Map<String, dynamic>? get bodyArguments => _arguments;
  static QParams get urlArguments => QR.params;

  static dynamic _backResult;
  static dynamic get backResult => _backResult;

  static bool isCurrentRoute(String route) {
    return routeMatch(route, _navigationStack.last.name);
  }

  static MRoute currentRoute() => _navigationStack.last;

  static bool routeMatch(String routeA, String routeB) {
    return routeA.split("?")[0] == routeB.split("?")[0];
  }

  static MRoute? getRouteByLevel({required int level}) {
    // check if level is a correct level
    if (level >= _navigationStack.length) {
      return null;
    }
    return _navigationStack.reversed.toList()[level];
  }

  static bool isRouteInStack<String>(String routeName) => _navigationStack
      .where((MRoute routeInstance) => routeInstance.name == routeName)
      .isNotEmpty;

  static void printRoutes() {
    if (_navigationStack.isEmpty) {
      mezDbgPrint("[[MEZROUTER]] => is Empty");
    }
    _navigationStack.forEach((MRoute mr) {
      mezDbgPrint("[[MEZROUTER]] => ${mr.name}");
    });
  }

  static Future<void> toNamed(
    String routeName, {
    bool ignoreSamePath = true,
    Map<String, dynamic>? arguments,
  }) async {
    mezDbgPrint("Trynig to go to ======>>>>>>>$routeName");
    final Future<void>? result =
        _addToStack(routeName, ignoreSamePath, arguments);
    _arguments = arguments;
    await QR.toName(routeName, ignoreSamePath: ignoreSamePath);
    return result ?? Future<void>.value();
  }

  static Future<void> toPath(
    String routeName, {
    bool ignoreSamePath = true,
    Map<String, dynamic>? arguments,
  }) async {
    mezDbgPrint("Trynig to go to ======>>>>>>>$routeName");
    final Future<void>? result =
        _addToStack(routeName, ignoreSamePath, arguments);
    _arguments = arguments;

    await QR
        .to(routeName, ignoreSamePath: ignoreSamePath)
        .then((value) => mezDbgPrint("After QR ==== to is finished"));
    mezDbgPrint("Completer result ======>${result == null}");
    return result ?? Future<void>.value();
  }

  static Future<void>? _addToStack(
      String routeName, bool ignoreSamePath, Map<String, dynamic>? arguments) {
    mezDbgPrint("[_] $routeName");
    if (!ignoreSamePath || _navigationStack.last.name != routeName) {
      _navigationStack.add(MRoute(
          name: routeName, arguments: arguments, completer: Completer<void>()));
      return _navigationStack.last.completer.future;
    }

    printRoutes();
    return null;
  }

  static Future<bool> back({backResult = null}) async {
    mezDbgPrint("Trynig to go back ${QR.currentPath}");
    final PopResult popResult = await QR.back();
    if (popResult != PopResult.Popped) {
      return false;
    } else {
      _backResult = backResult;
      return true;
    }
  }

  static void registerReturnToViewCallback(
      String routeName, Function callback) {
    _navigationStack
        .firstWhereOrNull(
            (MRoute routeInstance) => routeInstance.name == routeName)
        ?.returnToViewCallback = callback;
  }

  static void onPoppedCallback() {
    final String? routeToSearchFor =
        isRouteInStack(QR.currentPath) ? QR.currentPath : QR.currentRoute.name;
    mezDbgPrint("👫👫👫👫👫👫👫👫 backcallback for $routeToSearchFor");
    if (routeToSearchFor != null && isRouteInStack(routeToSearchFor)) {
      while (_navigationStack.last.name != routeToSearchFor) {
        mezDbgPrint("Popped ${_navigationStack.last.name}");
        _navigationStack.last.completer.complete();
        _navigationStack.removeLast();
        Future.delayed(
            Duration.zero, _navigationStack.last.returnToViewCallback?.call());
      }
    }
  }

  static Future<void> popEverythingTillBeforeHome() async {
    return popTillExclusive(SharedRoutes.kHomeRoute);
  }

  static Future<void> popEverythingTillBeforeWrapper() async {
    return popTillExclusive(SharedRoutes.kWrapperRoute);
  }

  static Future<void> popTillExclusive(String routeName) async {
    if (_navigationStack.isNotEmpty && isRouteInStack(routeName)) {
      while (!isCurrentRoute(routeName) &&
          !isCurrentRoute(SharedRoutes.kHomeRoute)) {
        final bool backSuccesful = await back();
        if (!backSuccesful) {
          break;
        }
        mezDbgPrint("Popped ${_navigationStack.last.name} ");
      }
    }
  }

  /// this will pop every route till the last route before the passed in route (if the passed in route exist in the satck)
  static Future<void> popTillInclusive(String routeName) async {
    if (_navigationStack.isNotEmpty) {
      while (isRouteInStack(routeName) &&
          !isCurrentRoute(SharedRoutes.kHomeRoute)) {
        final bool backSuccesful = await back();
        if (!backSuccesful) {
          break;
        }
        mezDbgPrint("Popped ${_navigationStack.last.name} ");
      }
    }
  }

  static void setupQR() {
    // enable debug logging for all routes
    QR.settings.enableDebugLog = true;

    // you can set your own logger
    QR.settings.logger = (String message) {
      mezDbgPrint(message);
    };

    // Set up the not found route in your app.
    // this route (path and view) will be used when the user navigates to a
    // route that does not exist.
    // QR.settings.notFoundPage = QRoute(
    //   path: '/404',
    //   builder: () => UnfoundPageScreen(),
    // );
    // QR.settings.initPage = const Material(child: MezLoaderWidget());

    // add observers to the app
    // this observer will be called when the user navigates to new route
    QR.observer.onNavigate.add((path, route) async {
      mezDbgPrint('Observer: Navigating to $path');
    });

    // to support android and browser back button
    QR.observer.onPop.add((path, route) async {
      onPoppedCallback();
    });

    // create initial route that will be used when the app is started
    // or when route is waiting for response
    //QR.settings.iniPage = InitPage();

    // Change the page transition for all routes in your app.
    QR.settings.pagesType = QFadePage();
  }
}
