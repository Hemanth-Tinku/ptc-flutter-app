import 'package:flutter/material.dart';
import 'package:cdpc/styles.dart';
import 'package:cdpc/screens/drives.dart';
import 'package:cdpc/screens/shuffle.dart';
import 'package:cdpc/screens/notification_list.dart';
import 'package:cdpc/screens/profilePage.dart';
import 'package:provider/provider.dart';
import 'package:cdpc/models/student_model.dart';
import 'package:cdpc/screens/offCampus_notifications.dart';
import 'package:cdpc/services/auth.dart';
// import 'package:cdpc/models/student_profile_model.dart';

class DrawerWidget extends StatefulWidget {
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final AuthService _auth = AuthService();
  StudentProfile studentProfile;
  @override
  Widget build(BuildContext context) {
    studentProfile = Provider.of<StudentProfile>(context);
    return Container(
      width: 250,
      child: Drawer(
        child: Column(children: [
          Expanded(
            flex: 1,
            child: DrawerHeader(
              child: _drawerHeader(
                  studentProfile.id, studentProfile.year, studentProfile.dept),
              decoration: BoxDecoration(color: Color(0xFF1261A0)),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
              _drawerItem('Home', Icon(Icons.home), onTapHome),
              _drawerItem('Drives', Icon(Icons.business_center), onTapDrives),
              _drawerItem('Shuffle', Icon(Icons.shuffle), onTapShuffle),
              _drawerItem('Notifications', Icon(Icons.notifications),
                  onTapNotifications),
              _drawerItem('Off-Campus Jobs', Icon(Icons.campaign),
                  onTapOffCampusNotices),
              _drawerItem('Internship Forms', Icon(Icons.assignment_rounded)),
              _drawerItem('Profile', Icon(Icons.person), onTapProfile),
              _drawerItem('Change Password', Icon(Icons.edit)),
              _drawerItem('PTC Team', Icon(Icons.group)),
              _drawerItem('Logout', Icon(Icons.logout), onTapLogout),
            ]),
          )
        ]),
      ),
    );
  }

  static Widget _drawerHeader(String id, String year, String dept) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage(id == 'S160680'
                  ? 'assets/images/pa.jpg'
                  : id == 'S160055'
                      ? 'assets/images/s160055.jpeg'
                      : 'assets/images/s160153.jpeg'),
              radius: 55.0,
            )),
        Align(
            alignment: Alignment.centerRight,
            child: Style.textHeading(id, Colors.white)),
        Align(
          alignment: Alignment.centerRight + Alignment(0, 0.3),
          child: Text(
            year + '-' + dept,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  static Widget _drawerItem(String title, Icon icon, [Function f]) {
    return InkWell(
        onTap: f,
        child: Container(
          child: ListTile(
            leading: icon,
            title: Text(title),
          ),
        ));
  }

  void onTapHome() {
    Navigator.pop(context);
  }

  void onTapDrives() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Drives()));
  }

  void onTapNotifications() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Notifications()));
  }

  void onTapProfile() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Profile(
                  studentProfile: studentProfile,
                )));
  }

  void onTapShuffle() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Shuffle()));
  }

  void onTapOffCampusNotices() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OffCampus()));
  }

  void onTapLogout() async {
    await _auth.signOut();
  }
}
