import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otm_template/constants/constants.dart';
import 'package:otm_template/router/observer.dart';
import 'package:otm_template/router/router.dart';
import 'package:otm_template/service/language_service.dart';
import 'package:otm_template/themes/app_theme.dart';
import 'package:otm_template/utils/local_cache.dart';
final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

void init() async{
  await Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
    EasyLocalization.ensureInitialized(),
  ]);
    await LocalCache.init();
  await AppTheme.init();
  runApp(ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // useInheritedMediaQuery: true,
      // rebuildFactor: (old, data) => true,
      builder: (c, w) => const App()));
}
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
    Future<bool> init() async {
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
        supportedLocales: LanguageService.supportedLocales.values.toList(),
        path: LanguageService.pathTrans,
        fallbackLocale: LanguageService.getCurrentLocal(),
      child: FutureBuilder(
              future: init(),
              builder: (context, snapshot) {
          return MaterialApp(
                            title: Constants.nameApp,
                            theme: AppTheme.theme,
                            navigatorKey: navKey,
                            locale: context.locale,
                            supportedLocales: context.supportedLocales,
                            localizationsDelegates: context.localizationDelegates,
                            navigatorObservers: [AppRouteObserver()],
                            debugShowCheckedModeBanner: false,
                            onGenerateRoute: AppRouter.generateRoute,
                            initialRoute: RouteNames.splash,
                          );
        }
      ),
    );
  }
}