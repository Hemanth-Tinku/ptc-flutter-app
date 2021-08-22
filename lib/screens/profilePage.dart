import 'package:cdpc/services/database.dart';
import 'package:flutter/material.dart';
import 'package:cdpc/styles.dart';
import 'package:cdpc/models/student_model.dart';
import 'package:cdpc/models/drives.dart';

class Profile extends StatefulWidget {
  final StudentProfile studentProfile;
  Profile({Key key, this.studentProfile}) : super(key: key);
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  TabController _tabController;
  // List<StudentProfile> studentProfile = StudentProfile.fetchAll();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    StudentProfile studentProfile = widget.studentProfile;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
          colors: [Color(0xFF072F5F), Color(0xFF3895D3)],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
        ))),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () => Navigator.pop(context),
            ),
            title: Style.textHeading('Profile', Colors.white),
          ),
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  //head part
                  Container(
                    height: height * 0.45,
                    child: LayoutBuilder(builder: (context, constraints) {
                      double innerHeight = constraints.maxHeight;
                      double innerWidth = constraints.maxWidth;
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: innerWidth * 0.1),
                                height: innerHeight * 0.65,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: (innerWidth * 0.45 -
                                            innerHeight * 0.35)),
                                    textHeading(studentProfile.name),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(studentProfile.id),
                                        Container(
                                          height: 15.0,
                                          width: 1.0,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                            '${studentProfile.year} ${studentProfile.dept}')
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    materialWrap(Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              textHeading(
                                                  Drive.registered.toString()),
                                              Text('Registered')
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              textHeading(
                                                  Drive().withdrawn.toString()),
                                              Text('Backlogs'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              )),
                          Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(studentProfile.id == 'S160680'
                                          ? 'assets/images/pa.jpg'
                                          : studentProfile.id == 'S160055'
                                              ? 'assets/images/s160055.jpeg'
                                              : 'assets/images/s160153.jpeg'),
                                  radius: innerWidth * 0.22,
                                ),
                              ))
                        ],
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  //body part
                  Container(
                      height: height * 0.6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Column(
                        children: [
                          TabBar(
                              controller: _tabController,
                              labelColor: Color(0xFF072F5F),
                              indicatorColor: Color(0xFF072F5F),
                              tabs: [
                                Tab(
                                    child: Text('Personal',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                Tab(
                                    child: Text('Academics',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)))
                              ]),
                          Container(
                            height: height * 0.5,
                            child: TabBarView(
                                controller: _tabController,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        materialWrap(bodyItem(Icon(Icons.call),
                                            studentProfile.phno.toString())),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        materialWrap(bodyItem(Icon(Icons.email),
                                            studentProfile.email.toString())),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        materialWrap(bodyItem(Icon(Icons.home),
                                            studentProfile.address)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        materialWrap(bodyItem(
                                            Icon(Icons.museum),
                                            studentProfile.schoolDetails,
                                            'CGPA : ${studentProfile.schoolCGPA}')),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        materialWrap(bodyItem(
                                          Icon(Icons.home_work),
                                          studentProfile.collegeDetails,
                                          'CGPA : ${studentProfile.collegeCGPA}',
                                        )),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        materialWrap(bodyItem(
                                          Icon(Icons.school),
                                          studentProfile.universityDetails,
                                          'CGPA : ${studentProfile.universityCGPA}',
                                        )),
                                      ],
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget textHeading(String text) {
    return Text(text,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF072F5F)));
  }

  Widget bodyItem(Icon icon, String text, [String subtext]) {
    return ListTile(
      leading: icon,
      title: Text(text),
      subtitle: (subtext != null ? Text(subtext) : null),
    );
  }

  Widget materialWrap(Widget widget) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Material(
        elevation: 3.0,
        type: MaterialType.card,
        child: widget,
      ),
    );
  }
}
