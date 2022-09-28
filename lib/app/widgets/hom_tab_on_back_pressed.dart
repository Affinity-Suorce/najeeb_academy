import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomTabOnBackPressed extends StatelessWidget {
  final Widget child;
  const HomTabOnBackPressed({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: child,
      onWillPop: () async {
        final tabsRouter = AutoTabsRouter.of(context);
        if (tabsRouter.activeIndex == 0) {
          return true;
        }
        tabsRouter.setActiveIndex(0);
        return false;
      },
    );
  }
}
