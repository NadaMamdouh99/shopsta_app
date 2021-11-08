import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/notifications/components/notifications_body.dart';
import 'package:shopsta_app/views/notifications/controllers/controller.dart';
import 'package:shopsta_app/widgets/app_bar.dart';


class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationsController= NotificationsController()..getNotifications();
    return BlocProvider(
      create: (context) => notificationsController,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: homeAppBar(0.0, context,false,false),
        body: NotificationsBody(),
      ),
    );
  }
}
