import 'package:flutter/material.dart';
import 'package:cdpc/styles.dart';
import 'package:cdpc/res/notification_component.dart';
import 'package:cdpc/models/notification_model.dart';

class Notifications extends StatefulWidget {
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
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
        title: Style.textHeading('Notifications', Colors.white),
      ),
      body: ListView(
          children: NotificationModel.fetchAll()
              .map((e) => NotificationComponent.createNotification(e, context))
              .toList()),
    );
  }
}
