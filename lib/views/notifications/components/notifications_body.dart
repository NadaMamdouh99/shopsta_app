import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/notifications/controllers/controller.dart';
import 'package:shopsta_app/views/notifications/states/controller.dart';
import 'package:shopsta_app/views/notifications/widgets/notification_content.dart';

class NotificationsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationController= NotificationsController.of(context);
    return BlocBuilder(
      cubit: notificationController,
      builder: (context,state) => state is NotificationsLoading ? Center(
          child: CircularProgressIndicator(
            backgroundColor: kPrimaryLightColor,
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
          ))
       :ListView.builder(
        itemCount: notificationController.notificationsModel.data.notificationData.length,
        itemBuilder: (BuildContext context, int index) {
          return NotificationContent(
              index,
              notificationController.notificationsModel.data.notificationData[index].title,
              notificationController.notificationsModel.data.notificationData[index].message,
          );
        },
      ),
    );
  }
}
