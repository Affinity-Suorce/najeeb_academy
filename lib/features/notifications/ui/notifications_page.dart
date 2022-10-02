import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/widgets/loading.dart';
import 'package:najeeb_academy/features/notifications/services/notifications_service.dart';
import 'package:najeeb_academy/features/notifications/ui/widgets/notification_widget.dart';

class NotificationsPage extends StatelessWidget {
  final NotificationsService service;
  const NotificationsPage({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: service..load(),
      builder: (context, _) {
        return WillPopScope(
          onWillPop: () async {
            service.makeAllNotificationsSeen;
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('الإشعارات'),
            ),
            body: RefreshIndicator(
              onRefresh: service.load,
              child: Builder(builder: (context) {
                final notifications = service.notifications;
                if (notifications == null) {
                  return const Loading();
                }
                if (notifications.isEmpty) {
                  return const Center(
                    child: Text('لايوجد إشعارات'),
                  );
                }
                return ListView.separated(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                  itemCount: notifications.length,
                  itemBuilder: (context, i) => NotificationWidget(
                    notification: notifications[i],
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      8.verticalSpace,
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
