import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/Phone/MobileAbout/mobileabout.dart';
import 'package:portfolio/Phone/MobileSkills/mobile_skills.dart';
import 'package:portfolio/Phone/MobileThrowBacks/mobile_Throw.dart';
import 'package:portfolio/Phone/TopCard/topcard.dart';

import '../../_models/Quote.dart';
import '../MobileProjects/mobileProject.dart';

class MobileMain extends StatelessWidget {
  MobileMain({super.key});
  final List<Widget> widget = [
    MobileAbout(),
    MobileThrowBack(),
    MobileProject(),
    MObileSkills()
  ];
  // ListView.builder(
  //         padding: EdgeInsets.only(bottom: 20, left: 4, right: 4),
  //         itemBuilder: (context, index) {
  //           return widget[index];
  //         },
  //         itemCount: widget.length,
  //       ),
  void displayModalSheet(context, Size size) {
    Scaffold.of(context).showBottomSheet((context) {
      return Container(
        height: 40,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int inde = Random().nextInt(50);
    return Scaffold(
      body: FractionallySizedBox(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: size.height * 0.30,
            collapsedHeight: 20,
            toolbarHeight: 0,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                motivationalQuotes[inde]["quote"]! +
                    "\n-" +
                    motivationalQuotes[inde]["author"]!,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .merge(TextStyle(fontSize: 7)),
                textAlign: TextAlign.end,
              ),
              stretchModes: [
                // StretchMode.blurBackground,
                // StretchMode.zoomBackground,
                StretchMode.fadeTitle
              ],
              background: Image.asset(
                "assets/image/mountain2.jpg",
                // fit: BoxFit.fitHeight,
                color: Colors.blueGrey.shade600,
                colorBlendMode: BlendMode.color,
              ),
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return widget[index];
            },
            itemCount: widget.length,
          )
        ],
      )),
      floatingActionButton: ElevatedButton.icon(
        icon: Icon(Icons.message),
        label: Text(""),
        onPressed: () {
          displayModalSheet(context, size);
        },
      ),
    );
  }
}
