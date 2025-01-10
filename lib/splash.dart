import 'package:flutter/material.dart';
import 'package:otm_template/router/router.dart';
import 'package:otm_template/utils/extension.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    //delay 2 seconds and navigate to home
    Future.delayed(const Duration(seconds: 2), () {
      AppRouter.goPageByName(RouteNames.home);
    });
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text('OPTIMUS').labelTitle,
            const Text("Template"),
          ],
        ),
      ),
    );
  }
}