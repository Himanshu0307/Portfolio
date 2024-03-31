// ignore_for_file: prefer_const_constructors
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/_models/ThemeM.dart';
import 'package:provider/provider.dart';

import '../../../_models/Experience.dart';

class MobileProject extends StatelessWidget {
  MobileProject({super.key});
  final List<ExperienceDetail> exp = [
    ExperienceDetail(
        Company: "Backup Service",
        Description: "Automatically takes SQL Backup and transfer over FTP",
        Type: "Internship",
        Time: "01/2023 - Currently"),
    ExperienceDetail(
        Company: "MAC Service",
        Type: "Competition",
        Description: "Advance MAC based Security for Web Service",
        Time: "2019"),
    ExperienceDetail(
        Company: "Wrecks",
        Type: "Hackathon",
        Description: "Vehicle Tracking System",
        Time: "2019"),
    ExperienceDetail(
        Company: "Lab Automation System",
        Type: "",
        Description: "IOT based System to control Appliances on Public Network",
        Time: "2019 - 2023"),
    ExperienceDetail(
        Company: "Maze Solver",
        Description: "Automatically find path in a maze and find shortest path",
        Type: "Senior Secondary Education",
        Time: "2016 - 2018")
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  "Projects",
                ),
              ),
            )),
        Expanded(
            flex: 4,
            child: CustomPaint(
              isComplex: true,
              willChange: true,
              size: Size(size.width, size.height * 0.65),
              painter: PaintWidget(exp, context),
            )),
      ],
    );
  }
}

class PaintWidget extends CustomPainter {
  final List<ExperienceDetail> profile;
  BuildContext context;
  PaintWidget(this.profile, this.context);
  var ox = 20.0;
  var oy = 3.0;
  @override
  void paint(Canvas canva, Size size) {
    canva.drawColor(Theme.of(context).colorScheme.background, BlendMode.dst);

    var style = Theme.of(context).textTheme.bodySmall!;
    var totalheight = size.height;
    var paint = Paint()
      ..color = Theme.of(context).textTheme.bodySmall!.color!
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill;

    profile.forEach((element) {
      //draw Paragraph
      ParagraphBuilder builder = ParagraphBuilder(ParagraphStyle(
        fontStyle: style.fontStyle,
        fontWeight: style.fontWeight,
        textAlign: TextAlign.justify,
      ))
        ..pushStyle(style.getTextStyle())
        ..addText("${element.Company} (${element.Description})");
      // ..addText("\n${element.Time}");
      Paragraph para = builder.build();
      para.layout(ParagraphConstraints(width: size.width * 0.7));
      canva.drawParagraph(para, Offset(ox + 6, oy - 2));

      canva.drawCircle(Offset(ox, oy), 2, paint);

      canva.drawLine(Offset(ox, oy),
          Offset(ox, oy += totalheight / (profile.length + 2)), paint);
      canva.drawLine(Offset(ox, oy), Offset(ox, oy += 5), paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
