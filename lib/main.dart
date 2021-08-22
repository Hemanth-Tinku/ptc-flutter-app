import 'package:cdpc/models/user.dart';
import 'package:cdpc/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cdpc/screens/wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return Text(snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider<AuthService>.value(value: AuthService()),
                StreamProvider<Student>.value(
                  value: AuthService().student,
                  initialData: FirebaseAuth.instance.currentUser == null
                      ? null
                      : Student(uid: FirebaseAuth.instance.currentUser.uid),
                )
              ],
              child: MaterialApp(
                title: 'CDPC',
                home: Wrapper(),
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  appBarTheme: AppBarTheme(
                      // title
                      ),
                  primaryColor: Color(0xFF072F5F),
                  accentColor: Color(0xFF3895D3),
                  fontFamily: 'Monsterrat',
                ),
              ),
            );
          }
          return Loading();
        });
  }
}
//Circular Loading 
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
