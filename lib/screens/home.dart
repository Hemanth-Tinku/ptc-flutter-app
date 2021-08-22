import 'package:cdpc/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:cdpc/styles.dart';
import 'package:cdpc/screens/drives.dart';
import 'package:cdpc/screens/notification_list.dart';
import 'package:cdpc/screens/help.dart';
import 'package:cdpc/models/notification_model.dart';
import 'package:cdpc/screens/notification_page.dart';
import 'package:cdpc/models/drives.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NotificationModel> updates = NotificationModel.fetchAll().toList();
  Drive drive = Drive();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('PTC'),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications),
              tooltip: 'Notifications',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notifications()));
              })
        ],
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              Image.asset('assets/images/rgukt_title.png',
                  height: height * 0.09,
                  width: width * 0.9,
                  fit: BoxFit.fitWidth),
              Text(
                'University Placement and Training Cell',
                style: TextStyle(
                  color: Color(0xFF1261A0),
                  // letterSpacing: 0.6,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Times New Roman',
                  fontSize: 17.0,
                  height: 2.5,
                ),
              ),
              Text(
                'S.M Puram, Etcherla, Srikakulam Dist,AP -532402',
                style: TextStyle(
                  fontSize: 12.0,
                  height: 1.5,
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              //Drives Info Card
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0x4458CCED),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                          title: Text(
                            'Drive Registrations',
                            style: TextStyle(fontSize: 17.0),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          )),
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                        height: 0,
                        indent: 15,
                        endIndent: 40,
                      ),
                      // SizedBox(
                      //   height: 10.0,
                      // ),
                      Container(
                        height: height * 0.21,
                        width: width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _createStatItem(
                                'Total Drives', '7', Colors.yellowAccent),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _createStatItem(
                                    'Active Drives', '1', Colors.redAccent),
                                _createStatItem(
                                    'You Registered', '3', Colors.green)
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Drives()));
                },
              ),

              SizedBox(height: height * 0.03),
              //Updates card
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 10.0,
                    borderOnForeground: true,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          ListTile(
                              // title: Text(
                              //   'Updates for You',
                              //   style: TextStyle(
                              //       fontSize: 17.0, color: Color(0xFF3895D3)),
                              // ),
                              title: Style.textHeading(
                                  'Updates For You', Color(0xFF3895D3)),
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Color(0xFF3895D3),
                              )),
                          Divider(
                            thickness: 1,
                            color: Color(0xFF3895D3),
                            height: 0,
                            indent: 15,
                            endIndent: 40,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          for (int i = 0; i < 5; i++)
                            if (updates[i].id % 2 == 0)
                              _createUpdatesItem(updates[i]),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    )),
              ),
              SizedBox(height: height * 0.1),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.contact_support_rounded),
        backgroundColor: Color(0xFF3895D3),
        tooltip: 'Help',
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Help())),
      ),
    );
  }

  Widget _createUpdatesItem(NotificationModel e) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NotificationPage(notificationModel: e))),
      child: Card(
        margin: EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 5.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: Color(0xFF1261A0))),
        elevation: 0.0,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(e.title),
        ),
      ),
    );
  }

  Widget _createStatItem(String title, String value, Color color) {
    return Flexible(
        fit: FlexFit.tight,
        child: Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(8.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: Text(value,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    )),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 11.0),
                ),
              )
            ],
          ),
        ));
  }
}
