import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gazihealty/core/palette.dart';
import 'package:gazihealty/view/food/food_view.dart';
import 'package:gazihealty/view/login/login_view.dart';
import 'package:gazihealty/view/register/register_view.dart';
import 'package:gazihealty/view/running/running_view.dart';
import 'package:gazihealty/view/water/water_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [const RunningScreen(), const WaterScreen(), const FoodScreen()];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.directions_run),
          title: ("Adım"),
          activeColorPrimary: Palette.light,
          inactiveColorPrimary: Palette.dark,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.drop),
          title: ("Su Takip"),
          activeColorPrimary: Palette.light,
          inactiveColorPrimary: Palette.dark,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.food_bank_outlined),
          title: ("Beslenme"),
          activeColorPrimary: Palette.light,
          inactiveColorPrimary: Palette.dark,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.easeOutExpo,
        duration: Duration(milliseconds: 500),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }
}
