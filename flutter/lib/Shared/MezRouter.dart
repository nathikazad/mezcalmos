import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

/// This only support named Routes
class MRoute {
  String name;
  dynamic args;
  Map<String, String>? params;
  MRoute({required this.name, this.args, this.params});
}

/// This does not support NestedNavigation yet.
class MezRouter extends RouteObserver<PageRoute<dynamic>> {
  static final List<MRoute> _navigationStack = <MRoute>[];
  // This will act as a lock, basically if there's any push/pop happening, we lock other functionalities to avoid race conditions
  // static bool _isBusy = false;
  static final List<Function> _delegates = [];

  static void printRoutes() {
    if (_navigationStack.isEmpty) {
      mezDbgPrint("[[MEZROUTER]] => is Empty");
    }
    _navigationStack.forEach((MRoute mr) {
      mezDbgPrint("[[MEZROUTER]] => ${mr.name}");
    });
  }

  /// Shortcut to [MezRouter.toNamed]
  static Future<Q?>? toNamed<Q>(
    String page, {
    arguments,
    // int? id, later on for nested routes
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    mezDbgPrint("Trynig to go to ======>>>>>>>$page");
    try {
      bool _shouldRoute = false;

      mezDbgPrint("[_] $page");
      if (!preventDuplicates) {
        _shouldRoute = true;
        _navigationStack
            .add(MRoute(name: page, args: arguments, params: parameters));
      } else {
        if (_navigationStack.isNotEmpty) {
          if (_navigationStack.last.name != page) {
            _shouldRoute = true;
            _navigationStack
                .add(MRoute(name: page, args: arguments, params: parameters));
          }
        } else {
          _shouldRoute = true;
          _navigationStack
              .add(MRoute(name: page, args: arguments, params: parameters));
        }
      }

      printRoutes();
      if (_shouldRoute)
        return Get.toNamed<Q>(
          page,
          arguments: arguments,
          parameters: parameters,
          preventDuplicates: preventDuplicates,
        );
      return null;
    } catch (e, s) {
      mezDbgPrint("Error => $e");
      mezDbgPrint("Stack => $s");
    }
    return null;
  }

  /// USE THIS ONLY FOR ACTUAL VIEW THAT ARE ON STACK!
  /// PS: TO POP DIALOGS / SNACKBARS .. USE [MezRouter.popDialog]
  static void back<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  }) {
    //   _navigationStack.removeLast();
    Get.back<T>(
      result: result,
      closeOverlays: closeOverlays,
      canPop: canPop,
      id: id,
    );
    printRoutes();
  }

  static void popDialog<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  }) {
    Get.back<T>(
      result: result,
      closeOverlays: closeOverlays,
      canPop: canPop,
      id: id,
    );
  }

  /// Get.until Wrapper -> Navigation.popUntil() shortcut.
  ///
  /// Calls pop several times in the stack until [predicate] returns true
  ///
  /// [id] is for when you are using nested navigation, as explained in documentation
  ///
  /// [predicate] can be used like this: Get.until((route) => Get.currentRoute == '/home')so when you get to home page,
  static void untill(bool Function(Route<dynamic>) predicate, {int? id}) {
    Get.until((Route<dynamic> route) {
      final bool res = predicate(route);
      if (res) {
        return true;
      } else {
        if (_navigationStack.isNotEmpty) {
          _navigationStack.removeLast();
        }
        return false;
      }
    }, id: id);
    printRoutes();
  }

  /// Get.offAndToNamed wrapper -> Navigation.popAndPushNamed() shortcut.
  ///
  /// Pop the current named page and pushes a new page to the stack in its place
  ///
  /// You can send any type of value to the other route in the [arguments]. It is very similar to offNamed() but use a different approach
  ///
  /// The offNamed() pop a page, and goes to the next. The offAndToNamed() goes to the next page, and removes the previous one. The route transition animation is different.
  static Future<Q?>? offAndToNamed<Q>(
    String page, {
    arguments,
    result,
    Map<String, String>? parameters,
  }) {
    _navigationStack.removeLast();
    final dynamic globalResult = Get.offAndToNamed<Q>(page,
            arguments: arguments, parameters: parameters, result: result)
        ?.then((value) {
      return value;
    }).whenComplete(() {
      _navigationStack.add(
        MRoute(name: page, args: arguments, params: parameters),
      );
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
  /// You can send any type of value to the other route in the [arguments].
  ///
  /// [id] is for when you are using nested navigation, as explained in documentation
  ///
  /// By default, GetX will prevent you from push a route that you already in, if you want to push anyway, set [preventDuplicates] to false
  ///
  /// Note: Always put a slash on the route ('/page1'), to avoid unnexpected errors
  static Future<Q?>? offNamed<Q>(
    String page, {
    arguments,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    _navigationStack.removeLast();
    final dynamic globalResult = Get.offNamed<Q>(
      page,
      arguments: arguments,
      parameters: parameters,
      preventDuplicates: preventDuplicates,
    )?.then((value) {
      return value;
    }).whenComplete(() {
      _navigationStack.add(
        MRoute(name: page, args: arguments, params: parameters),
      );
    });
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
  /// You can send any type of value to the other route in the [arguments].
  ///
  /// [predicate] can be used like this:
  /// `Get.until((route) => Get.currentRoute == '/home')`so when you get to home page,
  /// or also like
  /// `Get.until((route) => !Get.isDialogOpen())`, to make sure the dialog
  /// is closed
  ///
  /// [id] is for when you are using nested navigation,
  /// as explained in documentation
  ///
  /// Note: Always put a slash on the route ('/page1'), to avoid unexpected errors
  static Future<Q?>? offAllNamed<Q>(
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
          ? (Route<dynamic> route) {
              final bool res = predicate.call(route);
              if (res) {
                return true;
              } else {
                _navigationStack.removeLast();
                return false;
              }
            }
          : null,
    )?.then((value) {
      return value;
    });
    printRoutes();

    return globalResult;
  }

  /// **Get.offNamedUntil wrapper -> Navigation.pushNamedAndRemoveUntil()** shortcut.<br><br>
  ///
  /// Push the given named `page`, and then pop several pages in the stack
  /// until [predicate] returns true
  ///
  /// You can send any type of value to the other route in the [arguments].
  ///
  /// [id] is for when you are using nested navigation,
  /// as explained in documentation
  ///
  /// [predicate] can be used like this:
  /// `Get.offNamedUntil(page, ModalRoute.withName('/home'))`
  /// to pop routes in stack until home,
  /// or like this:
  /// `Get.offNamedUntil((route) => !Get.isDialogOpen())`,
  /// to make sure the dialog is closed
  ///
  /// Note: Always put a slash on the route name ('/page1'), to avoid unexpected errors

  static Future<Q?>? offNamedUntil<Q>(
    String page,
    bool Function(Route<dynamic>) predicate, {
    int? id,
    arguments,
    Map<String, String>? parameters,
  }) {
    final dynamic globalResult = Get.offNamedUntil<Q>(
      page,
      (Route<dynamic> route) {
        final bool res = predicate.call(route);
        if (res) {
          return true;
        } else {
          if (_navigationStack.isNotEmpty) {
            _navigationStack.removeLast();
          }
          return false;
        }
      },
      arguments: arguments,
      parameters: parameters,
      id: id,
    )?.then((value) {
      return value;
    });
    printRoutes();
    return globalResult;
  }

  /// Get currentRoute on the stack! null if navigationStack is empty
  static MRoute? currentRoute() =>
      _navigationStack.isEmpty ? null : _navigationStack.last;

  /// This basically gives a route based on the [level] given.
  ///
  /// a [Level] is basically how many steps to go back from [this.currentRoute].
  ///
  /// exp : In the following navigation stack [home -> Settings -> UserInfo], so basically UserInfo was last in which means we are currently in [UserInfo] Route, and we wanna check what's the route on our navigation stack that is sitting behind UserInfo, so the use of our function will be like this : getRouteByLevel(level: 1).
  ///
  /// Note : calling getRouteByLevel(level:0) will simply return current route, which is basically a shortcut to [this.currentRoute]
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
  /// This checks if a route is in NavigationStack.
  static bool isRouteInStack<String>(String routeName) => _navigationStack
      .where((MRoute routeInstance) => routeInstance.name == routeName)
      .isNotEmpty;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    final MRoute? _rCurrent = currentRoute();

    if (previousRoute is PageRoute && route is PageRoute && _rCurrent != null) {
      if (_rCurrent.name == route.settings.name) {
        mezDbgPrint("[+] MissMatch on NavStack :: resolving ... done!");
        _navigationStack.removeLast();
        printRoutes();
      }
    }
  }
}
