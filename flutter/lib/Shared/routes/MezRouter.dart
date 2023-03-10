import 'dart:async';

import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class MRoute {
  String name;

  Completer<void> completer;
  Map<String, dynamic>? arguments;

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

  static Future<void> back({backResult = null}) {
    if (QR.currentPath == _navigationStack.last.name || QR.currentRoute.name == _navigationStack.last.name) {
      _navigationStack.last.completer.complete();
      _navigationStack.removeLast();
    }
    _backResult = backResult;
    mezDbgPrint("Trynig to go back");
    return QR.back();
  }

  static Future<void> popEverythingTillBeforeHome() async {
    return popTillBefore(SharedRoutes.kHomeRoute);
  }

  static Future<void> popEverythingTillBeforeWrapper() async {
    return popTillBefore(SharedRoutes.kWrapperRoute);
  }

  static Future<void> popTill(String routeName) async {
    if (isRouteInStack(routeName)) {
      while (!isCurrentRoute(routeName)) {
        await back();
        mezDbgPrint("Popped ${_navigationStack.last.name} ");
        _navigationStack.removeLast();
      }
    }
  }

  static Future<void> popTillBefore(String routeName) async {
    mezDbgPrint("Start popping till before ====> $routeName");
    printRoutes();
    if (isRouteInStack(routeName)) {
      mezDbgPrint("Start popping till before ====> $routeName");
      while (!isCurrentRoute(routeName)) {
        await back();
        mezDbgPrint("Popped ${_navigationStack.last.name} ");
        if (_navigationStack.isNotEmpty) {
          _navigationStack.removeLast();
        }
      }
    }
    // await back();
    // if (_navigationStack.isNotEmpty) {
    //   _navigationStack.removeLast();
    // }
  }

  // static Future<void> popEverythingUntil(String route) async {
  //   await QR.navigator.popUntilOrPushName(route);
  //   printRoutes();
  // }

  // static Future<void> offAndToNamed(
  //   String page, {
  //   Map<String, String>? arguments,
  // }) async {
  //   await back();
  //   return toNamed(page, arguments: arguments);
  // }

  // @override
  // void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
  //   super.didPop(route, previousRoute);
  //   final MRoute? _rCurrent = currentRoute();
  //   _navigationStack.forEach((MRoute element) {
  //     mezDbgPrint("---> ${element.name}");
  //   });
  //   if (previousRoute is PageRoute && route is PageRoute && _rCurrent != null) {
  //     if (_rCurrent.name == route.settings.name) {
  //       mezDbgPrint(
  //           "[+] MissMatch on NavStack :: current [MezStack](${_rCurrent.name}) | [Material](${route.settings.name})  :: resolving ... done!");
  //       if (_navigationStack.isNotEmpty) {
  //         _navigationStack.removeLast();
  //       }
  //       printRoutes();
  //     }
  //   }
  // }
}
