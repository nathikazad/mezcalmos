import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

/// This only support named Routes
class MRoute {
  String name;
  dynamic args;
  Map<String, dynamic>? params;

  MRoute({required this.name, this.args, this.params});
}

/// This does not support NestedNavigation yet.
class MezRouter extends RouteObserver<PageRoute<dynamic>> {
  static final List<MRoute> _navigationStack = <MRoute>[];
  static Map<String, dynamic>? _arguments;

  static Map<String, dynamic>? get bodyArguments => _arguments;

  static QParams get urlArguments => QR.params;

  // This will act as a lock, basically if there's any push/pop happening, we lock other functionalities to avoid race conditions
  // static bool _isBusy = false;
  static final List<Function> _delegates = [];

  static bool isCurrentRoute(String route) =>
      routeMatch(route, _navigationStack.last.name);

  static bool routeMatch(String routeA, String routeB) {
    return routeA.split("?")[0] == routeB.split("?")[0];
  }

  static void printRoutes() {
    if (_navigationStack.isEmpty) {
      mezDbgPrint("[[MEZROUTER]] => is Empty");
    }
    _navigationStack.forEach((MRoute mr) {
      mezDbgPrint("[[MEZROUTER]] => ${mr.name}");
    });
  }

  /// Shortcut to [MezRouter.toNamed]
  static Future<void> toNamed<Q>(
    String page, {
    bool preventDuplicates = true,
    Map<String, dynamic>? arguments,
  }) {
    mezDbgPrint("Trynig to go to ======>>>>>>>$page");
    addToStack(page, preventDuplicates, arguments);
    _arguments = arguments;
    return QR.toName(page, ignoreSamePath: false);
  }

  static Future<void> toPath<Q>(
    String page, {
    bool preventDuplicates = true,
    Map<String, dynamic>? arguments,
  }) {
    mezDbgPrint("Trynig to go to ======>>>>>>>$page");
    addToStack(page, preventDuplicates, arguments);
    _arguments = arguments;
    return QR.to(page, ignoreSamePath: false);
  }

  static void addToStack(
      String page, bool preventDuplicates, Map<String, dynamic>? arguments) {
    bool _shouldRoute = false;
    mezDbgPrint("[_] $page");
    if (!preventDuplicates) {
      _shouldRoute = true;
      _navigationStack
          .add(MRoute(name: page, args: arguments, params: arguments));
    } else {
      if (_navigationStack.isNotEmpty) {
        if (_navigationStack.last.name != page) {
          _shouldRoute = true;
          _navigationStack
              .add(MRoute(name: page, args: arguments, params: arguments));
        }
      } else {
        _shouldRoute = true;
        _navigationStack
            .add(MRoute(name: page, args: arguments, params: arguments));
      }
    }
    printRoutes();
  }

  /// USE THIS ONLY FOR ACTUAL VIEW THAT ARE ON STACK!
  /// PS: TO POP DIALOGS / SNACKBARS .. USE [MezRouter.popDialog]
  static Future<void> back<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  }) {
    // Navigator.pop(QR.context!, result);
    return QR.back();
    /* Get.back<T>(
      result: result,
      closeOverlays: closeOverlays,
      canPop: canPop,
      id: id,
    );*/
    printRoutes();
  }

  static void popDialog<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  }) {
    Navigator.pop(QR.context!, result);

    /* Get.back<T>(
      result: result,
      closeOverlays: closeOverlays,
      canPop: canPop,
      id: id,
    );*/
  }

  /// Get.until Wrapper -> Navigation.popUntil() shortcut.
  ///
  /// Calls pop several times in the stack until [predicate] returns true
  ///
  /// [id] is for when you are using nested navigation, as explained in documentation
  ///
  /// [predicate] can be used like this: Get.until((router) => Get.currentRoute == '/home')so when you get to home page,
  static void untill(bool Function(Route<dynamic>) predicate, {int? id}) {
    Navigator.popUntil(QR.context!, (Route<dynamic> route) {
      final bool res = predicate(route);
      if (res) {
        return true;
      } else {
        if (_navigationStack.isNotEmpty) {
          _navigationStack.removeLast();
        }
        return false;
      }
    });

    /* Get.until((Route<dynamic> router) {
      final bool res = predicate(router);
      if (res) {
        return true;
      } else {
        if (_navigationStack.isNotEmpty) {
          _navigationStack.removeLast();
        }
        return false;
      }
    }, id: id);*/

    printRoutes();
  }

  /// Get.offAndToNamed wrapper -> Navigation.popAndPushNamed() shortcut.
  ///
  /// Pop the current named page and pushes a new page to the stack in its place
  ///
  /// You can send any type of value to the other router in the [arguments]. It is very similar to offNamed() but use a different approach
  ///
  /// The offNamed() pop a page, and goes to the next. The offAndToNamed() goes to the next page, and removes the previous one. The router transition animation is different.
  static Future<Q?>? offAndToNamed<Q>(
    String page, {
    arguments,
    result,
    Map<String, String>? parameters,
  }) {
    if (_navigationStack.isNotEmpty) {
      _navigationStack.removeLast();
    }
    _navigationStack.add(
      MRoute(name: page, args: arguments, params: parameters),
    );

    final dynamic globalResult = Navigator.of(QR.context!)
        .popAndPushNamed(page, arguments: arguments, result: result)
        .then((Object? value) {
      return value;
    });
    printRoutes();

    return globalResult;
  }

  /// Get.offNamed Wrapper -> Navigation.pushReplacementNamed() shortcut.
  ///
  /// Pop the current named page in the stack and push a new one in its place
  ///
  /// It has the advantage of not needing context, so you can call from your business logic.
  ///
  /// You can send any type of value to the other router in the [arguments].
  ///
  /// [id] is for when you are using nested navigation, as explained in documentation
  ///
  /// By default, GetX will prevent you from push a router that you already in, if you want to push anyway, set [preventDuplicates] to false
  ///
  /// Note: Always put a slash on the router ('/page1'), to avoid unnexpected errors
  static Future<Q?>? offNamed<Q>(
    String page, {
    arguments,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    if (_navigationStack.isNotEmpty) {
      _navigationStack.removeLast();
    }
    _navigationStack.add(
      MRoute(name: page, args: arguments, params: parameters),
    );
    final dynamic globalResult = Navigator.of(QR.context!)
        .pushReplacementNamed(
      page,
      arguments: arguments,
    )
        .then((Object? value) {
      return value;
    });
    /*final dynamic globalResult = Get
        .offNamed<Q>(
      page,
      arguments: arguments,
      parameters: parameters,
      preventDuplicates: preventDuplicates,
    )
    ?.then((value) {
    return value;
    });
     */
    printRoutes();

    return globalResult;
  }

  ///  **Get.offAllNamed Wrapper -> Navigation.pushNamedAndRemoveUntil()** shortcut.<br>
  ///
  /// Push a named `page` and pop several pages in the stack
  /// until [predicate] returns true. [predicate] is optional
  ///
  /// It has the advantage of not needing context, so you can
  /// call from your business logic.
  ///
  /// You can send any type of value to the other router in the [arguments].
  ///
  /// [predicate] can be used like this:
  /// `Get.until((router) => Get.currentRoute == '/home')`so when you get to home page,
  /// or also like
  /// `Get.until((router) => !Get.isDialogOpen())`, to make sure the dialog
  /// is closed
  ///
  /// [id] is for when you are using nested navigation,
  /// as explained in documentation
  ///
  /// Note: Always put a slash on the router ('/page1'), to avoid unexpected errors
/*  static Future<Q?>? offAllNamed<Q>(
    String newRouteName, {
    RoutePredicate? predicate,
    arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    final dynamic globalResult = Get.offAllNamed<Q>(
      newRouteName,
      arguments: arguments,
      parameters: parameters,
      predicate: predicate != null
          ? (Route<dynamic> router) {
              final bool res = predicate.call(router);
              if (res) {
                return true;
              } else {
                if (_navigationStack.isNotEmpty) {
                  _navigationStack.removeLast();
                }
                return false;
              }
            }
          : null,
    )?.then((value) {
      return value;
    });
    printRoutes();

    return globalResult;
  }*/

  /// **Get.offNamedUntil wrapper -> Navigation.pushNamedAndRemoveUntil()** shortcut.<br><br>
  ///
  /// Push the given named `page`, and then pop several pages in the stack
  /// until [predicate] returns true
  ///
  /// You can send any type of value to the other router in the [arguments].
  ///
  /// [id] is for when you are using nested navigation,
  /// as explained in documentation
  ///
  /// [predicate] can be used like this:
  /// `Get.offNamedUntil(page, ModalRoute.withName('/home'))`
  /// to pop routes in stack until home,
  /// or like this:
  /// `Get.offNamedUntil((router) => !Get.isDialogOpen())`,
  /// to make sure the dialog is closed
  ///
  /// Note: Always put a slash on the router name ('/page1'), to avoid unexpected errors

  static Future<Q?>? offNamedUntil<Q>(
    String page,
    bool Function(Route<dynamic>) predicate, {
    int? id,
    arguments,
    Map<String, String>? parameters,
  }) {
    final dynamic globalResult =
        Navigator.of(QR.context!).pushNamedAndRemoveUntil(
      page,
      (Route route) {
        final bool res = predicate.call(route);
        mezDbgPrint("[mezrouter] PREDICATE ==> $res");
        if (res) {
          printRoutes();
          return true;
        } else {
          printRoutes();
          if (_navigationStack.isNotEmpty) {
            _navigationStack.removeLast();
          }
          return false;
        }
      },
      arguments: arguments,
    ).then((Object? value) {
      return value;
    });
    _navigationStack
        .add(MRoute(name: page, args: arguments, params: parameters));
    printRoutes();
    return globalResult;
  }

  static void popEverythingAndNavigateTo(route, {args}) {
    popUntilAndNavigateTo(SharedRoutes.kHomeRoute, route, args: args);
  }

  static Future<void> popEverything() {
    Navigator.of(QR.context!).pushNamedAndRemoveUntil(
        SharedRoutes.kHomeRoute, (Route<dynamic> route) => false);
    return Future<void>.delayed(Duration.zero);
  }

  static void popUntilAndNavigateTo(untilRoute, toRoute, {args}) {
    MezRouter.offNamedUntil(toRoute, (Route<dynamic> route) {
      mezDbgPrint(
          "CurrentRoute#${route.settings.name} / untilRoute#$untilRoute");
      return (route.settings.name == untilRoute);
    }, arguments: args);
  }

  /// Get currentRoute on the stack! null if navigationStack is empty
  static MRoute? currentRoute() =>
      _navigationStack.isEmpty ? null : _navigationStack.last;

  /// This basically gives a router based on the [level] given.
  ///
  /// a [Level] is basically how many steps to go back from [this.currentRoute].
  ///
  /// exp : In the following navigation stack [home -> Settings -> UserInfo], so basically UserInfo was last in which means we are currently in [UserInfo] Route, and we wanna check what's the router on our navigation stack that is sitting behind UserInfo, so the use of our function will be like this : getRouteByLevel(level: 1).
  ///
  /// Note : calling getRouteByLevel(level:0) will simply return current router, which is basically a shortcut to [this.currentRoute]
  ///
  /// Note : Giving a level that is out of range, will return null.
  static MRoute? getRouteByLevel({required int level}) {
    // check if level is a correct level
    if (level >= _navigationStack.length) {
      return null;
    }
    return _navigationStack.reversed.toList()[level];
  }

  /// to
  /// This checks if a router is in NavigationStack.
  static bool isRouteInStack<String>(String routeName) => _navigationStack
      .where((MRoute routeInstance) => routeInstance.name == routeName)
      .isNotEmpty;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    final MRoute? _rCurrent = currentRoute();
    _navigationStack.forEach((MRoute element) {
      mezDbgPrint("---> ${element.name}");
    });
    if (previousRoute is PageRoute && route is PageRoute && _rCurrent != null) {
      if (_rCurrent.name == route.settings.name) {
        mezDbgPrint(
            "[+] MissMatch on NavStack :: current [MezStack](${_rCurrent.name}) | [Material](${route.settings.name})  :: resolving ... done!");
        if (_navigationStack.isNotEmpty) {
          _navigationStack.removeLast();
        }
        printRoutes();
      }
    }
  }
}
