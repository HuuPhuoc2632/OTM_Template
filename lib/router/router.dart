import 'package:flutter/material.dart';
import 'package:otm_template/init.dart';
import 'package:otm_template/main.dart';
import 'package:otm_template/screen/defautl.dart';
import 'package:otm_template/screen/home/home_screen.dart';
import 'package:otm_template/splash.dart';


MaterialPageRoute commonNavigateTo(String? routeName, Widget destination) {
  return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => destination);
}

class AppRouter {
  static String? routeName;
  static MaterialPageRoute navigateTo(Widget destination) {
    return commonNavigateTo(routeName, destination);
  }

  static void goBack([dynamic result]) {
    Navigator.of(navKey.currentContext!).pop(result);
  }

  static Future goPageByName(String routeName, {Object? arguments}) {
    return Navigator.of(navKey.currentContext!)
        .pushNamed(routeName, arguments: arguments);
  }

  static void goToPageAndRemoveUntil(String routeName, bool Function(Route<dynamic>) predicate, {Object? arguments}) {
    Navigator.of(navKey.currentContext!)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments as Map<String, dynamic>?;
    routeName = settings.name;
    switch (settings.name) {
      case RouteNames.splash:
        return navigateTo(const Splash());
      case RouteNames.home:
        return navigateTo(const HomeScreen());
      default:
        return navigateTo(const Defautl());
    }
  }
}

class RouteNames {
  static const splash = 'splash';
  static const home = "home";
}
