import 'package:cdpc/models/company_model.dart';
import 'package:cdpc/models/drives.dart';
import 'package:flutter/material.dart';
import 'package:cdpc/styles.dart';

class DrivePage extends StatefulWidget {
  final Company company;
  DrivePage({Key key, this.company}) : super(key: key);
  _DrivePageState createState() => _DrivePageState();
}

class _DrivePageState extends State<DrivePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    print(widget.company);
    return Scaffold(
        backgroundColor: Color(0xFF072F5F),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Style.textHeading('Drive Registration', Colors.white),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.30,
              child: Center(
                child: CircleAvatar(

                  radius: height * 0.11,
                  
                  backgroundImage: AssetImage(widget.company.imgPath),
                
                ),
              ),
            ),
            FractionallySizedBox(
              alignment: Alignment.bottomLeft,
              heightFactor: 0.70,
              child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0)),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(30, 30, 20, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _createTitleText('Company Name :'),
                          _createText(widget.company.name),
                          _createTitleText('Stipend Offered :'),
                          _createText(widget.company.payscale),
                          _createTitleText('Intern Duration :'),
                          _createText(widget.company.duration),
                          _createTitleText('Work Location :'),
                          _createText(widget.company.location),
                          _createTitleText('Registration Last date :'),
                          _createText(widget.company.lastdate),
                          Container(
                            padding: EdgeInsets.only(top: 20.0),
                            alignment: Alignment.center,
                            child: widget.company.isRegistered
                                ? _createStatusText(
                                    'Registered !', Colors.green)
                                : widget.company.dateTime
                                            .compareTo(DateTime.now()) >
                                        0
                                    ? ElevatedButton(
                                        child: Text('Register'),
                                        style: elevatedButtonStyle,
                                        onPressed: () async {
                                          setState(() {
                                            Drive().incrementRegistered();
                                            widget.company.isRegistered = true;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'Registered Succefully !')));
                                        },
                                      )
                                    : _createStatusText('Closed !', Colors.red),
                          )
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ));
  }

  Widget _createTitleText(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Color(0xFF072F5F),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _createText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  Widget _createStatusText(String text, Color color) {
    return TextButton(
      style: TextButton.styleFrom(backgroundColor: color),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
      onPressed: null,
    );
  }
}
