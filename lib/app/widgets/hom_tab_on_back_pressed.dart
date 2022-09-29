import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/extensions/snack_bar_build_context.dart';

class HomTabOnBackPressed extends StatefulWidget {
  final Widget child;
  const HomTabOnBackPressed({
    super.key,
    required this.child,
  });

  @override
  State<HomTabOnBackPressed> createState() => _HomTabOnBackPressedState();
}

class _HomTabOnBackPressedState extends State<HomTabOnBackPressed> {
  bool canExit = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: widget.child,
      onWillPop: () async {
        const duration = Duration(seconds: 1);
        final tabsRouter = AutoTabsRouter.of(context);
        if (tabsRouter.activeIndex == 0) {
          if (canExit) {
            return true;
          }
          context.showBasicSnackBar('اضغط مرة أخرى للخروج', duration: duration);
          setState(() {
            canExit = true;
          });
          Future.delayed(duration).then((_) => setState(() {
                canExit = false;
              }));
        }
        tabsRouter.setActiveIndex(0);
        return false;
      },
    );
  }
}
