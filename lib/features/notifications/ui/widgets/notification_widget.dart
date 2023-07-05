import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/extensions/date_time_helper.dart';
import 'package:najeeb_academy/features/notifications/models/notification_model.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationModel notification;
  const NotificationWidget({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: notification.seen ? 2.r : 8.r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: Icon(
              notification.seen
                  ? CupertinoIcons.check_mark
                  : CupertinoIcons.info,
              color: notification.seen ? Colors.green : AppColors.indigo,
            ),
            title: Text(notification.title),
            subtitle: Text(notification.description),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8.w, bottom: 8.h),
            child: Text(
              notification.timePublish.toLocal().toString(),
              textAlign: TextAlign.end,
            ),
            // Text(notification.updateAt.agoFrom(), textAlign: TextAlign.end),
          ),
        ],
      ),
    );
  }
}
