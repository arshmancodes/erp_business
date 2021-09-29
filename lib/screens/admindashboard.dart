import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:erp_business/controllers/attendance_controller.dart';
import 'package:erp_business/screens/nav_bar_items/adduser.dart';
import 'package:erp_business/screens/nav_bar_items/attendance.dart';
import 'package:erp_business/screens/nav_bar_items/certificates.dart';
import 'package:erp_business/screens/nav_bar_items/create_qr.dart';
import 'package:erp_business/screens/nav_bar_items/home.dart';
import 'package:erp_business/screens/nav_bar_items/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  AttendanceController controller = Get.find<AttendanceController>();
  int _currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    controller.attendanceModel();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            CreateQR(),
            AddUser(),
            Attendance(),
            Profile(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController!.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(title: Text('Create QR'), icon: Icon(Icons.home)),
          BottomNavyBarItem(
              title: Text('Add User'), icon: Icon(Icons.note_add_sharp)),
          BottomNavyBarItem(title: Text('History'), icon: Icon(Icons.history)),
          BottomNavyBarItem(title: Text('Profile'), icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
