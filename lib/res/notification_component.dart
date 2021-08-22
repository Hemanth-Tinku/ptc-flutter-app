import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:cdpc/models/notification_model.dart';
import 'package:cdpc/screens/notification_page.dart';

class NotificationComponent {
  // notification list
  static Widget createNotification(
      NotificationModel notificationModel, BuildContext context) {
    return InkWell(
        child: Card(
          margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
          elevation: 5.0,
          shadowColor: Color(0xFF1261A0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(8.0, 15.0, 15.0, 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    notificationModel.title,
                    style: TextStyle(
                        fontFamily: 'Vardana',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _createNotificationTags(notificationModel.date),
                    notificationModel.isOffCampus == true &&
                            notificationModel.eligibiltyCandidates != null
                        ? Row(
                            children: [
                              _createNotificationTags('Off-Campus'),
                              SizedBox(
                                width: 1.0,
                              ),
                              _createNotificationTags(
                                  notificationModel.eligibiltyCandidates),
                            ],
                          )
                        : notificationModel.isOffCampus == true
                            ? _createNotificationTags('Off-Campus')
                            : notificationModel.eligibiltyCandidates != null
                                ? _createNotificationTags(
                                    notificationModel.eligibiltyCandidates)
                                : null
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NotificationPage(
                      notificationModel: notificationModel,
                    ))));
  }

  //notification card view
  static Widget createNotificationCard(
      String title, String date, String eligibiltyCandidates, bool isOffCampus,
      [String body, String link]) {
    return Card(
      margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      elevation: 10.0,
      shadowColor: Color(0xFF1261A0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: 'Vardana',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            if (body != null)
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 50.0),
                child: Column(
                  children: [
                    Text(body),
                    if (link != null)
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: RichText(
                          text: TextSpan(
                              text: 'Link : ',
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                    text: link,
                                    style: TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => launch(link))
                              ]),
                        ),
                      )
                  ],
                ),
              ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _createNotificationTags(date),
                isOffCampus == true && eligibiltyCandidates != null
                    ? Row(
                        children: [
                          _createNotificationTags('Off-Campus'),
                          SizedBox(
                            width: 1.0,
                          ),
                          _createNotificationTags(eligibiltyCandidates),
                        ],
                      )
                    : isOffCampus == true
                        ? _createNotificationTags('Off-Campus')
                        : eligibiltyCandidates != null
                            ? _createNotificationTags(eligibiltyCandidates)
                            : null
              ],
            )
          ],
        ),
      ),
    );
  }

  static Widget _createNotificationTags(String text) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Color(0xFF1261A0))),
      child: Text(text),
    );
  }
}
