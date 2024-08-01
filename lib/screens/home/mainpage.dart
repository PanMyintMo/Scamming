import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_registration/firebase_services/firebase_auth.dart';
import 'package:student_registration/model/usermodel.dart';
import 'package:student_registration/util/appstyle.dart';
import 'package:student_registration/util/app_color.dart';
import 'package:student_registration/screens/home/homebody.dart';
import 'package:student_registration/util/drawer/navbar.dart';
import 'package:student_registration/util/drawer/navutil.dart';
import 'package:student_registration/util/scroll_provider.dart';
import 'package:student_registration/util/drawer/drawerprovider.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:student_registration/module/category/categorymodule.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:student_registration/routes/app_routers/scammer_router.dart';
import 'package:student_registration/routes/category/category_routes.dart';
import 'package:student_registration/util/search.dart';

part 'mobile_drawer.dart';
part 'homescreen.dart';

class MainPage extends StatefulWidget {
  final int currentIndex;
  const MainPage({super.key, required this.currentIndex});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final screens = [
    const HomeBody(),
  ];

  List<CurvedNavigationBarItem> navAdminMenu = [
    CurvedNavigationBarItem(
      child: const Icon(Icons.widgets_rounded, color: AppColors.whiteColor),
      label: 'Home',
      labelStyle: curveBottomNavStyle,
    ),
    CurvedNavigationBarItem(
      child: const Icon(Icons.person, color: AppColors.whiteColor),
      label: 'Profile',
      labelStyle: curveBottomNavStyle,
    ),
    CurvedNavigationBarItem(
      label: 'Me',
      labelStyle: curveBottomNavStyle,
      child: const Icon(Icons.account_circle, color: AppColors.whiteColor),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

    return Scaffold(
      key: drawerProvider.key,
      bottomNavigationBar: CurvedNavigationBar(
        key: bottomNavigationKey,
        backgroundColor: AppColors.greenColor,
        color: AppColors.blackColor.withGreen(70),
        buttonBackgroundColor: AppColors.greenColor,
        animationDuration: const Duration(milliseconds: 300),
        index: _currentIndex,
        items: navAdminMenu,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          pageController.jumpToPage(index);
        },
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        titleSpacing: 0,
        title: const Text(
          'Home Page',
          style: TextStyle(
              fontSize: 14,
              color: AppColors
                  .whiteColor), // Make sure the text color is also set if needed
        ),
        backgroundColor: AppColors.greenColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: AppColors.whiteColor),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const MobileDrawer(),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
          bottomNavigationKey.currentState?.setPage(index);
        },
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
    );
  }
}
