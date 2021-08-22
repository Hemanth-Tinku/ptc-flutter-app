import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Help & Support'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
            child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
          child: Column(
            children: [
              Text('For technical queries and help, drop an email to'),
              ListTile(
                leading: Icon(Icons.mail, color: Color(0xFF1261A0)),
                title: Text('S160680@rguktsklm.ac.in',
                    style: TextStyle(color: Color(0xFF1261A0), fontSize: 16.0)),
                trailing: IconButton(
                  icon: Icon(
                    Icons.copy,
                    color: Color(0xFF1261A0),
                  ),
                  onPressed: () async {
                    await Clipboard.setData(
                        ClipboardData(text: 'S160680@rguktsklm.ac.in'));
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Copied to Clipboard !')));
                  },
                ),
              )
            ],
          ),
        )));
  }
}
