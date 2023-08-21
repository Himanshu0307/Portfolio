// ignore_for_file: prefer_const_constructors
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/_models/ThemeM.dart';
import 'package:provider/provider.dart';

import '../../../_models/Experience.dart';

class Experience extends StatelessWidget {
  Experience({super.key});
  final List<ExperienceDetail> exp = [
    ExperienceDetail(
        Company: "Finnaux Tech Solution",
        Description: "This is a Description",
        Type: "Internship",
        Time: "01/2023 - Currently"),
    ExperienceDetail(
        Company: "IIT Bombay Meshmerize",
        Type: "Competition",
        Description: "B.Tech in Computer Science and Engineering",
        Time: "2019"),
    ExperienceDetail(
        Company: "NASA Space App Challange",
        Type: "Hackathon",
        Description: "B.Tech in Computer Science and Engineering",
        Time: "2019"),
    ExperienceDetail(
        Company: "JECRC",
        Type: "B.Tech in Computer Science and Engineering",
        Description: "B.Tech in Computer Science and Engineering",
        Time: "2019 - 2023"),
    ExperienceDetail(
        Company: "Maheshwari Public School",
        Description: "This is a Description",
        Type: "Senior Secondary Education",
        Time: "2016 - 2018")
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.5,
          height: size.height * 0.8,
          child: Stack(
            children: [
              Column(
                children: [
                  Text(
                    "Major Throwbacks",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium!,
                  ),
                  Consumer<ThemeM>(builder: (context, provider, child) {
                    return CustomPaint(
                      isComplex: true,
                      willChange: true,
                      painter: PaintWidget(exp, context),
                      child: SizedBox(
                        height: size.height * 0.5,
                        width: size.width * 0.6,
                      ),
                    );
                  })
                ],
              )
            ],
          ),
        )
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

    var style = Theme.of(context).textTheme.bodyMedium!;
    var totalheight = size.height;
    var paint = Paint()
      ..color = Theme.of(context).textTheme.bodyLarge!.color!
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill;

    profile.forEach((element) {
      canva.drawLine(Offset(ox, oy),
          Offset(ox, oy += totalheight / profile.length), paint);
      canva.drawCircle(Offset(ox, oy), 2, paint);

      //draw Paragraph
      ParagraphBuilder builder = ParagraphBuilder(ParagraphStyle(
        fontStyle: style.fontStyle,
        fontWeight: style.fontWeight,
        textAlign: TextAlign.justify,
      ))
        ..pushStyle(style.getTextStyle())
        ..addText("${element.Company} (${element.Type})")
        ..addText("\n${element.Time}");
      Paragraph para = builder.build();
      para.layout(ParagraphConstraints(width: size.width * 0.7));
      canva.drawParagraph(para, Offset(ox + 6, oy - 2));
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
