import 'package:auto_route/auto_route.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/app/widgets/hom_tab_on_back_pressed.dart';
import 'package:najeeb_academy/features/auth/repositories/user_info_repository.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
    this.userInfo,
  }) : super(key: key);
  final UserInfoRepository? userInfo;
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      inheritNavigatorObservers: true,
      routes: const [
        HomeRoute(),
        CoursesRoute(),
        LecturesRoute(),
        PaymentsRoute(),
        ProfileRoute()
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return HomTabOnBackPressed(
          child: Scaffold(
            body: FadeTransition(
              opacity: animation,
              child: child,
            ),
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: tabsRouter.activeIndex,
              showElevation: true, // use this to remove appBar's elevation
              onItemSelected: (index) {
                tabsRouter.setActiveIndex(index);
              },
              items: [
                BottomNavyBarItem(
                  icon: const Icon(CupertinoIcons.home),
                  title: const Text('الرئيسية'),
                  activeColor: AppColors.indigo,
                ),
                BottomNavyBarItem(
                  icon: const Icon(CupertinoIcons.rectangle_stack),
                  title: const Text('دوراتي'),
                  activeColor: AppColors.indigo,
                ),
                BottomNavyBarItem(
                  icon: const Icon(CupertinoIcons.book),
                  title: const Text('دروسي'),
                  activeColor: AppColors.indigo,
                ),
                BottomNavyBarItem(
                  icon: const Icon(CupertinoIcons.calendar),
                  title: const Text('الدفعات'),
                  activeColor: AppColors.indigo,
                ),
                BottomNavyBarItem(
                  icon: const Icon(CupertinoIcons.person),
                  title: const Text('حسابي'),
                  activeColor: AppColors.indigo,
                ),
              ],
            ),
          ),
        );
      },
      lazyLoad: true,
    );
    // return PersistentTabView(
    //   context,
    //   controller: _controller,
    //   screens: _buildScreens(),
    //   items: _navBarsItems(),
    //   confineInSafeArea: true,
    //   backgroundColor: Colors.white,
    //   handleAndroidBackButtonPress: true,
    //   resizeToAvoidBottomInset: true,
    //   stateManagement: true,
    //   hideNavigationBarWhenKeyboardShows: true,
    //   decoration: NavBarDecoration(
    //     boxShadow: [
    //       const BoxShadow(
    //           color: Color(0x669e9e9e),
    //           spreadRadius: 1,
    //           blurRadius: 6,
    //           offset: Offset(-1, 0))
    //     ],
    //     borderRadius: BorderRadius.circular(10.0),
    //     colorBehindNavBar: Colors.white,
    //   ),
    //   popAllScreensOnTapOfSelectedTab: true,
    //   popActionScreens: PopActionScreensType.all,
    //   itemAnimationProperties: const ItemAnimationProperties(
    //     duration: Duration(milliseconds: 200),
    //     curve: Curves.easeInOut,
    //   ),
    //   screenTransitionAnimation: const ScreenTransitionAnimation(
    //     animateTabTransition: true,
    //     curve: Curves.easeInOut,
    //     duration: Duration(milliseconds: 200),
    //   ),
    //   navBarStyle: NavBarStyle.style1,
    // );
  }
}
