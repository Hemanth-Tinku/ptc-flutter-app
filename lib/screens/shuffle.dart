import 'package:flutter/material.dart';
import 'package:cdpc/styles.dart';

class Shuffle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Style.textHeading('Shuffle', Colors.white),
      ),
      body: ListView(
        children: [
          shuffleCard('Ramersoft written test', 'K-4 R1 C5', '05-01-2020',
              '10am - 11 am', context),
          shuffleCard(
              'CodeTantra', 'L-1 R4 C3', '15-03-2020', '9am - 11 am', context)
        ],
      ),
    );
  }

  Widget shuffleCard(String testTitle, String seatPosition, String date,
      String timeSlot, context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
      child: Card(
        color: Color(0xFF58CCED),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
          child: Column(children: [
            Text(
              testTitle,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.airline_seat_recline_normal_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  seatPosition,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  _textStyle(date),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  _textStyle(timeSlot),
                ],
              )
            ])
          ]),
        ),
      ),
    );
  }

  Widget _textStyle(String text) {
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ));
  }
}
