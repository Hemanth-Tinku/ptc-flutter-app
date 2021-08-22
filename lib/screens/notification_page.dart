import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cdpc/styles.dart';
import 'package:cdpc/res/notification_component.dart';
import 'package:cdpc/models/notification_model.dart';

class NotificationPage extends StatelessWidget {
  final NotificationModel notificationModel;
  NotificationPage({Key key, this.notificationModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Style.textHeading('Notification View', Colors.white),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: NotificationComponent.createNotificationCard(
                notificationModel.title,
                notificationModel.date,
                notificationModel.eligibiltyCandidates,
                notificationModel.isOffCampus,
                notificationModel.body,
                notificationModel.link),
          ),
        ));
  }
}
