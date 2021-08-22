import 'package:flutter/material.dart';
import 'package:cdpc/styles.dart';
import 'package:cdpc/models/notification_model.dart';
import 'package:cdpc/screens/notification_page.dart';

class OffCampus extends StatefulWidget {
  _OffCampusState createState() => _OffCampusState();
}

class _OffCampusState extends State<OffCampus> {
  List<NotificationModel> notices = NotificationModel.fetchAll();
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
        title: Style.textHeading('OffCampus Notifications', Colors.white),
      ),
      body: ListView(children: [
        for (int i = 0; i < notices.length; i++)
          if (notices[i].isOffCampus) _createItem(notices[i])
      ]),
    );
  }

  Widget _createItem(NotificationModel e) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NotificationPage(notificationModel: e))),
      child: Card(
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Color(0xFF1261A0))),
        elevation: 0.0,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Text(e.title),
        ),
      ),
    );
  }
}
