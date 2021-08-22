import 'package:flutter/material.dart';
import 'package:cdpc/widgets/drivesCards.dart';
import 'package:cdpc/styles.dart';

class Drives extends StatefulWidget {
  _DriveState createState() => _DriveState();
}

class _DriveState extends State<Drives> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Style.textHeading('Drives', Colors.white),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white38,
          tabs: [
            Tab(
              child: Text('Internships'),
            ),
            Tab(
              child: Text('Placements'),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [DrivesCards(), Text(' ')],
      ),
    );
  }
}
