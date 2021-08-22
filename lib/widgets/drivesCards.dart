import 'package:cdpc/screens/drivePage.dart';
import 'package:flutter/material.dart';
import 'package:cdpc/models/company_model.dart';

class DrivesCards extends StatefulWidget {
  _DrivesCardsState createState() => _DrivesCardsState();
}

class _DrivesCardsState extends State<DrivesCards> {
  final List<Company> companies = Company.fetchAll();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GridView.count(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.03),
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 15.0,
        primary: true,
        childAspectRatio: 0.70,
        children: companies
            .map((e) => _buildCard(e.name, e.payscale, e.imgPath, e.dateTime,
                e.lastdate, e.isRegistered, e, context, height))
            .toList(),
      ),
    );
  }

  Widget _buildCard(
      String name,
      String payScale,
      String imgPath,
      DateTime lastdate,
      String date,
      bool isRegistered,
      Company e,
      context,
      double height) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 20.0,
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DrivePage(company: e)));
        },
        child: Column(
          children: [
            Container(
                height: height * 0.23,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    // border: Border.all(color: Color(0xFF072F5F)),
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.contain,
                    )),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          isRegistered
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 2.0),
                                  child: Text(
                                    'Registered',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11.0),
                                  ),
                                  color: Colors.green,
                                )
                              : lastdate.compareTo(DateTime.now()) > 0
                                  ? Container()
                                  : Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 2.0),
                                      child: Text(
                                        'Closed',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.0),
                                      ),
                                      color: Colors.red,
                                    ),
                        ]),
                  ),
                )),
            SizedBox(
              height: 8.0,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(name,
                  maxLines: 1,
                  style: TextStyle(
                      color: Color(0xFF072F5F),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold)),
            ),
            Row(children: [
              SizedBox(
                width: 16.0,
              ),
              Icon(
                Icons.payment,
                size: 18.0,
              ),
              Text(
                payScale,
                style: TextStyle(fontSize: 12.0),
              ),
            ]),
            Row(children: [
              SizedBox(
                width: 16.0,
              ),
              Icon(Icons.calendar_today, size: 18.0),
              Text(
                date,
                style: TextStyle(fontSize: 12.0),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
