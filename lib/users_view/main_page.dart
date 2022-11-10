import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.blueGrey,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style4,
      // neumorphicProperties: const NeumorphicProperties(showSubtitleText: true),
    );
  }

  List<Widget> _buildScreens() {
    return const [HomePage(), HomePage(), HomePage(), HomePage(), HomePage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.blueGrey.shade400,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.book_rounded),
        title: ("Journals"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.blueGrey.shade400,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.coffee_maker_outlined),
        title: ("Coffee Time"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.blueGrey.shade400,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.coffee_maker_outlined),
        title: ("Coffee Time"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.blueGrey.shade400,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.coffee_maker_outlined),
        title: ("Coffee Time"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.blueGrey.shade400,
      ),
    ];
  }
}
