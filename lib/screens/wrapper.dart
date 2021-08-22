import 'package:cdpc/models/notification_model.dart';
import 'package:cdpc/models/student_model.dart';
import 'package:cdpc/models/user.dart';
import 'package:cdpc/screens/home.dart';
import 'package:cdpc/screens/login.dart';
import 'package:cdpc/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either home or login widget
    final student = Provider.of<Student>(context);
    print(student);
    if (student == null) {
      return Login();
    } else {
      return FutureBuilder(
          future: DatabaseService().getUserDataFromFirestore(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // Map<String, dynamic> data = snapshot.data();
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider.value(value: DatabaseService()),
                  StreamProvider<StudentProfile>.value(
                    value: DatabaseService().user,
                    initialData: StudentProfile(
                        id: 'S160153',
                        name: 'N.Sashi Kumar',
                        address: 'Srikakulam',
                        email: 'S160153@rguktsklm.ac.in',
                        phno: 9704625087,
                        dept: 'CSE',
                        year: 'E3',
                        collegeCGPA: 9,
                        collegeDetails: 'RGUKT Srikakulam (PUC)',
                        schoolCGPA: 10,
                        schoolDetails: 'SRM',
                        universityCGPA: 7,
                        universityDetails: 'RGUKT Srikakulam (btech)'),
                  ),
                ],
                child: Home(),
              );
            } else {
              return Loading();
            }
          });
    }
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
      height: 250.0,
    );
  }
}
