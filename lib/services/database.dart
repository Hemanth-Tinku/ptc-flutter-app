import 'package:cdpc/models/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cdpc/models/student_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService extends ChangeNotifier {
//database reference
  List<NotificationModel> _notifications;
  StudentProfile _student;
  final db = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser.uid;
// Student model
  StudentProfile getUserData() {
    print(_student);

    return _student;
  }

// read Student data from firestore
  Future<DocumentSnapshot> getUserDataFromFirestore() async {
    return await db.collection('users').doc(uid).get();
  }

//read stream User document
  Stream<StudentProfile> get user {
    return db.collection('users').doc(uid).snapshots().map((docSnapshot) {
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data();
        return convertToStudentProfile(data);
      } else {
        print('No user data exists');
        return null;
      }
    });
    // notifyListeners();
  }

  //Firebase model to student model
  StudentProfile convertToStudentProfile(Map<String, dynamic> data) {
    // if (docSnapshot.exists) {
    //   Map<String, dynamic> data = docSnapshot.data();
    _student = StudentProfile(
        id: data['id'],
        name: data['name'],
        address: data['address'],
        email: data['email'],
        phno: data['phone'],
        dept: data['department'],
        year: data['year'],
        collegeCGPA: data['collegeCGPA'],
        collegeDetails: data['collegeDetails'],
        schoolCGPA: data['schoolCGPA'],
        schoolDetails: data['schoolDetails'],
        universityCGPA: data['universityCGPA'],
        universityDetails: data['universityDetails']);
    return _student;
  }

  //get notification
  Future<QuerySnapshot> getNotifications() async {
    dynamic snapshot = await db.collection('notification').get();
    return snapshot;
  }

  //Notification stream
  // Stream<List<NotificationModel>> get notification {
  //   return db.collection('notification').snapshots().map((querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       _notifications.add(convertToNotificationModel(doc.data()));
  //     });
  //     return _notifications;
  //   });
  // }

//   //Firebase model to notification model
  // NotificationModel convertToNotificationModel(Map<String, dynamic> data) {
  //   return NotificationModel(
  //     isOffCampus: data['isOffCampus'],
  //     title: data['title'],
  //     body: data['body'],
  //     link: data['link'],
  //     date: data['date'].toString(),
  //     // eligibiltyCandidates: data['eligibiltyCandidates'],
  //   );
  // }
}
