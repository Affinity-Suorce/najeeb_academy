import 'dart:async';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/features/home/presentation/privacy_poilcy.dart';
import 'package:najeeb_academy/features/home/presentation/widgets/bottom_section.dart';
import 'package:najeeb_academy/features/home/presentation/widgets/program_section.dart';
import 'package:najeeb_academy/features/home/presentation/widgets/program_section_unloade_section.dart';
import 'package:najeeb_academy/features/home/presentation/widgets/slider_section.dart';
import 'package:najeeb_academy/features/home/presentation/widgets/top_section.dart';
import 'package:najeeb_academy/features/home/services/schedule_service.dart';
import 'package:najeeb_academy/features/notifications/services/notifications_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LinkedScrollControllerGroup? _controllers;
  ScrollController? _back;
  ScrollController? _front;
  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _back = _controllers!.addAndGet();
    _front = _controllers!.addAndGet();
  }

  @override
  void dispose() {
    _back?.dispose();
    _front?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) {
              final service = DI.notificationsServiceFactory();
              Timer.periodic(const Duration(seconds: 5), (_) {
                service
                  ..load()
                  ..checkHasNotifications;
              });

              return service;
            },
          ),
          ChangeNotifierProvider(
            create: (_) {
              final scheduleService = DI.scheduleServiceFactory();
              scheduleService.getEvents();
              return scheduleService;
            },
          ),
        ],
        builder: (context, child) => Scaffold(
              body: Stack(
                children: [
                  _Backlayer(
                    scrollController: _back,
                  ),
                  _FrontLayer(
                    scrollController: _front,
                  ),
                  DI.userInfo.isAuthenticated
                      ? PositionedDirectional(
                          end: 8.w,
                          top: 24.h,
                          child: IconButton(
                            onPressed: () {
                              DI.router.push(NotificationsRoute(
                                  service:
                                      context.read<NotificationsService>()));
                            },
                            tooltip: 'الإشعارات',
                            icon: Badge(
                              alignment: AlignmentDirectional.topEnd,
                              showBadge: context
                                  .watch<NotificationsService>()
                                  .hasUnseenNotifications,
                              badgeContent: Text(
                                context
                                    .watch<NotificationsService>()
                                    .unseenNotificationsCount
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.white,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.r),
                                child: const Icon(
                                  CupertinoIcons.bell_solid,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ))
                      : const SizedBox.shrink(),
                ],
              ),
            ));
  }
}

class _Backlayer extends StatelessWidget {
  const _Backlayer({Key? key, this.scrollController}) : super(key: key);
  final ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        controller: scrollController,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: AppColors.indigo,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 2,
            )
          ],
        ),
      ),
    );
  }
}

class _FrontLayer extends StatelessWidget {
  const _FrontLayer({Key? key, this.scrollController}) : super(key: key);
  final ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        controller: scrollController,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
              child: TopSection(),
            ),
            const SizedBox(
              height: 24,
            ),
            const SliderSection(),
            const SizedBox(
              height: 24,
            ),
            DI.userInfo.isAuthenticated
                ? (context.watch<ScheduleService>().isLoaded != null &&
                        context.watch<ScheduleService>().isLoaded!)
                    ? const ProgramSection()
                    : const ProgramSectionNotLoadedWidget()
                : const SizedBox.shrink(),
            DI.userInfo.isAuthenticated
                ? const SizedBox(
                    height: 24,
                  )
                : const SizedBox.shrink(),
            const HomePageBottomSection(),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.privacy_tip),
                  title: const Text('سياسة الخصوصية'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrivacyPolicy()));
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
