import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class MRoute {
  String name;
  dynamic args;
  Map<String, dynamic>? params;

  MRoute({required this.name, this.args, this.params});
}

class MezRouter {
  static final List<MRoute> _navigationStack = <MRoute>[
    MRoute(name: SharedRoutes.kWrapperRoute)
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
  }) {
    mezDbgPrint("Trynig to go to ======>>>>>>>$routeName");
    _addToStack(routeName, ignoreSamePath, arguments);
    _arguments = arguments;
    return QR.toName(routeName, ignoreSamePath: ignoreSamePath);
  }

  static Future<void> toPath(
    String routeName, {
    bool ignoreSamePath = true,
    Map<String, dynamic>? arguments,
  }) {
    mezDbgPrint("Trynig to go to ======>>>>>>>$routeName");
    _addToStack(routeName, ignoreSamePath, arguments);
    _arguments = arguments;
    return QR.to(routeName, ignoreSamePath: ignoreSamePath);
  }

  static void _addToStack(
      String routeName, bool ignoreSamePath, Map<String, dynamic>? arguments) {
    mezDbgPrint("[_] $routeName");
    if (!ignoreSamePath) {
      _navigationStack
          .add(MRoute(name: routeName, args: arguments, params: arguments));
    } else if (_navigationStack.last.name != routeName) {
      _navigationStack
          .add(MRoute(name: routeName, args: arguments, params: arguments));
    }
    printRoutes();
  }

  static Future<void> back({backResult = null}) {
    _navigationStack.removeLast();
    _backResult = backResult;
    return QR.back();
  }

  static Future<void> closeDialog({backResult = null}) {
    _backResult = backResult;
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
