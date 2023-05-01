import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmeapp/controller/auth_controller.dart';
import 'package:meetmeapp/views/match/match_screen.dart';
import 'package:meetmeapp/views/profile/profile_screen.dart';
import '../constants/app_constants.dart';
import '../controller/all_user_controller/favorshortlist_user_controller.dart';
import '../controller/all_user_controller/get_matchuser_by_location_controller.dart';
import '../controller/get_all_user_controller.dart';
import '../controller/membership_plan/get_membership_plan_controller.dart';
import '../controller/profile_images/get_profile_image_controller.dart';
import '../controller/user_profile_controller.dart';
import 'home_screen.dart';
import 'search/search_screen.dart';

class HomeTabsScreen extends StatefulWidget {
  const HomeTabsScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabsScreen> createState() => _HomeTabsScreenState();
}

class _HomeTabsScreenState extends State<HomeTabsScreen> {
  UserProfileController userProfileController = Get.put(UserProfileController());
  GetAllUserController getAllUserController = Get.put(GetAllUserController());
  GetMembershipPlanController getMembershipPlanController = Get.put(GetMembershipPlanController());
  ShortListUserController shortListUserController = Get.put(ShortListUserController());
  GetMatchByLocationController getMatchByLocationController = Get.put(GetMatchByLocationController());
  GetProfileImageController getProfileImageController = Get.put(GetProfileImageController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProfileController.getuserprofiledata(refresh: true);
    getAllUserController.getalluserdata(refresh: true);
    getMembershipPlanController.getmembershiplandata(refresh: true);
    getMembershipPlanController.getaddonlandata(refresh: true);
    shortListUserController.getshortlistdata(refresh: true);
    getMatchByLocationController.getmatchlocationdata(refresh: true);
  }

  int tabIndex = 0;
  //int currentIndex = 0;

  final List<Widget> tabScreens = [
    HomeScreen(),
    MatchScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];
  //int activeTabIndex = 0;

  changeIndex(index) {
    setState(() {
      Get.find<AuthController>().currentIndex.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: (Get.find<AuthController>().currentIndex.value == 0)
            ? const HomeScreen()
            : (Get.find<AuthController>().currentIndex.value == 1)
            ? const MatchScreen()
            : (Get.find<AuthController>().currentIndex.value == 2)
            ? const SearchScreen()
            : const ProfileScreen(),
        // IndexedStack(
        //   index: activeTabIndex,
        //   children: tabScreens,
        // ),
        //tabScreens[AppManager.authController.activeTabIndex.value],
        // bottomNavigationBar:  Container(
        //     decoration: const BoxDecoration(
        //       // boxShadow: <BoxShadow>[
        //       //   BoxShadow(color: Color(0xff997264), offset: Offset(0, -.3)),
        //       // ],
        //     ),
        //     child: BottomNavigationBar(
        //       //backgroundColor: const Color(0xff2B2929),
        //         unselectedFontSize: 0.0,
        //         selectedFontSize: 0.0,
        //         iconSize: 0.0,
        //
        //         //backgroundColor: Colors.transparent,
        //         showSelectedLabels: true,
        //         showUnselectedLabels: true,
        //         currentIndex: activeTabIndex,
        //         onTap: (index) {
        //           // setState(() {
        //           activeTabIndex = index;
        //           // });
        //         },
        //         type: BottomNavigationBarType.fixed,
        //         unselectedLabelStyle:  TextStyle(
        //           fontSize: 13,
        //           fontWeight: FontWeight.w700,
        //         ),
        //         selectedLabelStyle:  TextStyle(
        //           //color: (activeTabIndex == index) ? primaryColor : greyColor,
        //           fontSize: 13,
        //           fontWeight: FontWeight.w700,
        //         ),
        //         selectedItemColor: primaryColor,
        //         unselectedItemColor: greyColor,
        //         items: [
        //           buildTab(
        //               name: 'Home',
        //               iconAddress: 'assets/images/icons/home.png',
        //               isActive: activeTabIndex == 0 ? true : false),
        //           buildTab(
        //               name: 'Matches',
        //               iconAddress: 'assets/images/icons/matches.png',
        //               isActive: activeTabIndex == 1 ? true : false),
        //           buildTab(
        //               name:'Search',
        //               iconAddress: 'assets/images/icons/search.png',
        //               isActive: activeTabIndex == 2 ? true : false),
        //           buildTab(
        //               name: 'Profile',
        //               iconAddress: 'assets/images/icons/profile.png',
        //               isActive:activeTabIndex == 3 ? true : false),
        //         ])),

        bottomNavigationBar: Container(
          height: 55.0,
          alignment: Alignment.center,
          child: BottomAppBar(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getBottomBarItemTile(0, 'assets/images/icons/home.png', 'Home'),
                getBottomBarItemTile(1, 'assets/images/icons/matches.png', 'Matches'),
                getBottomBarItemTile(2, 'assets/images/icons/search.png', 'Search'),
                getBottomBarItemTile(3, 'assets/images/icons/profile.png', 'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildTab({required String name,required String iconAddress, required bool isActive}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 5),
        child: SizedBox(
          height: 30,
          width: 30,
          child: Image.asset(
            iconAddress,
            //color: isActive ? AppColors.backgroundpurple :  AppColors.icongrey,
            height: 22,
            width: 22,
          ),
        ),
      ),
      label: name,
    );
  }

  getBottomBarItemTile(int index, String icon, String title) {
    return InkWell(
      focusColor: primaryColor,
      onTap: () {
        changeIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 22,
            width: 22,
            color: (Get.find<AuthController>().currentIndex.value == index) ? primaryColor : greyColor,
          ),
          Text(
            title,
            style: TextStyle(
              color: (Get.find<AuthController>().currentIndex.value == index) ? primaryColor : greyColor,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}