import 'package:flutter/material.dart';
import 'package:portfolio/Phone/MobileAbout/mobileabout.dart';
import 'package:portfolio/Phone/MobileSkills/mobile_skills.dart';
import 'package:portfolio/Phone/MobileThrowBacks/mobile_Throw.dart';
import 'package:portfolio/Phone/TopCard/topcard.dart';

import '../MobileProjects/mobileProject.dart';

class MobileMain extends StatelessWidget {
  MobileMain({super.key});
  final List<Widget> widget = [
    TopCard(),
    MobileAbout(),
    MobileThrowBack(),
    MobileProject(),
    MObileSkills()
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: FractionallySizedBox(
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 20, left: 4, right: 4),
          itemBuilder: (context, index) {
            return widget[index];
          },
          itemCount: widget.length,
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        icon: Icon(Icons.message),
        label: Text(""),
        onPressed: () {},
      ),
    );
  }
}
