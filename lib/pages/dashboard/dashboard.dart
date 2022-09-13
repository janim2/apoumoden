import 'package:fitness/components/utils/color_constant.dart';
import 'package:fitness/pages/dashboard/Diet.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'Results.dart';
import 'Selfcare.dart';
import 'Sleep.dart';
import 'Supplements.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          children: <Widget>[
            Home(),
            Diet(),
            Selfcare(),
            Sleep(),
            Supplements(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home, size: 26.0),
            ),
            Tab(
              icon: Icon(Icons.restaurant_menu, size: 26.0),
            ),
            Tab(
              icon: Icon(Icons.bathtub_outlined, size: 26.0),
            ),
            Tab(
              icon: Icon(Icons.bed, size: 26.0),
            ),
            Tab(
              icon: Icon(Icons.medication, size: 26.0),
            ),
          ],
          labelPadding: EdgeInsets.all(5.0),
          labelColor: ColorConstant.secondary,
          unselectedLabelColor: Colors.black12,
          indicatorWeight: 0.01,
        ),
      ),
    );
  }
}
