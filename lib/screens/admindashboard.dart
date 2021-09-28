import 'package:erp_business/screens/nav_bar_items/attendance.dart';
import 'package:erp_business/screens/nav_bar_items/certificates.dart';
import 'package:erp_business/screens/nav_bar_items/home.dart';
import 'package:erp_business/screens/nav_bar_items/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _index = 0;
  PageController _pageController = PageController();
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      Home(),
      Certificates(),
      Attendance(),
      Profile(),
    ];
  }

  void _onPageChanged(int index) {
    setState(() {
      _index = index;
    });
  }

  void _onNavTap(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        textStyle: GoogleFonts.oswald(),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black45,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.note_add_sharp),
        title: ("Certificates"),
        textStyle: GoogleFonts.oswald(),
        activeColorPrimary: Colors.orange,
        inactiveColorPrimary: Colors.black45,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.history),
        title: ("Attendance"),
        textStyle: GoogleFonts.oswald(),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.black45,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        textStyle: GoogleFonts.oswald(),
        activeColorPrimary: Colors.indigoAccent,
        inactiveColorPrimary: Colors.black45,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PersistentTabView(
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
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style9,
    ));
  }
}
