import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  static void onRouteChange(Route? route) {
    final currentRoute = route?.settings.name;
    if (kDebugMode) debugPrint("Route: $currentRoute");
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint('[pop] ${route.settings.name}');
    onRouteChange(previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint('[push] ${route.settings.name}');
    onRouteChange(route);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace();
    debugPrint(
        '[replace] ${oldRoute?.settings.name} = ${newRoute?.settings.name} ');
    onRouteChange(newRoute);
  }
}
