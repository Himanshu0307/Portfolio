import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});
  static const String about =
      "Absolutely, Himanshu Sharma. Here's an introduction line for your resume portfolio.Dedicated and driven professional with a passion for your profession or field, Himanshu Sharma combines mention a standout skill or characteristic, e.g., 'innovative problem-solving' or 'proven leadership abilities' to achieve impactful results. With a strong foundation in mention relevant expertise or education, I am committed to briefly state your career objective or mission, e.g., 'driving innovation in the tech industry' or 'delivering exceptional client experiences'. My journey is defined by continuous learning and a relentless pursuit of excellence";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: size.width * 0.5,
          height: size.height * 0.8,
          child: const Stack(
            children: [
              Column(
                children: [
                  Text(
                    "ABOUT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 90,
                    ),
                  ),
                  Text(
                    about,
                    textAlign: TextAlign.justify,
                    softWrap: true,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
