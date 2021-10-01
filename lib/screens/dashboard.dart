import 'package:erp_business/controllers/attendance_controller.dart';
import 'package:erp_business/screens/nav_bar_items/attendance.dart';
import 'package:erp_business/screens/nav_bar_items/certificates.dart';
import 'package:erp_business/screens/nav_bar_items/home.dart';
import 'package:erp_business/screens/nav_bar_items/profile.dart';
import 'package:erp_business/screens/nav_bar_items/scanqr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _index = 0;
  PageController _pageController = PageController();
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  AttendanceController controller = Get.find<AttendanceController>();

  List<Widget> _buildScreens() {
    return [
      ScanQR(),
      Certificates(),
      Attendance(),
      Profile(),
    ];
  }

  @override
  void initState() {
    controller.attendanceModel();
    super.initState();
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
