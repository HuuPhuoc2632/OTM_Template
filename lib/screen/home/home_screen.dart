import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:otm_template/themes/index.dart';
import 'package:otm_template/utils/extension.dart';
import 'package:ternav_icons/ternav_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<IconData> iconList = [
    TernavIcons.lightOutline.home_2,
    TernavIcons.lightOutline.search,
    TernavIcons.lightOutline.bell,
    TernavIcons.lightOutline.settings,
  ];
  int activeIndex = 0;

 void _onTap(int index) {
    setState((){
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text('HOME').labelTitle,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: null,
        backgroundColor: AppColors.warningColor,
        child: Icon(TernavIcons.lightOutline.plus),
        
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        backgroundColor: AppColors.primaryColor,
        activeIndex: activeIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        inactiveColor: AppColors.whiteColor,
        activeColor: AppColors.warningColor,
        notchMargin: 4,
                // leftCornerRadius: 32,
        // rightCornerRadius: 32,
        onTap: _onTap,
        //other params
      ),
    );
  }
}
