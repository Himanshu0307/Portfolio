import 'package:flutter/material.dart';

class MobileThrowBack extends StatelessWidget {
  const MobileThrowBack({super.key});
  static const thro =
      "I'm a proud graduate of Maheshwari Public School, where I completed my Senior Secondary Education. Fuelled by my fascination for technology, I embarked on a journey to earn a B.Tech in Computer Science at JECRC College. It's with immense satisfaction that I can say I successfully crossed the finish line of my undergraduate studies there. My academic path has laid a strong foundation for my passion for all things tech-related, and I can't wait to keep exploring and contributing in the world of computer science.";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.5,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    "Throwbacks",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    thro,
                    textAlign: TextAlign.justify,
                  )
                ],
              )),
          SizedBox(
            width: 4,
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    "Passionate,Enthusiastic,Energetic,Dedication, Life's too short to work Hard so Work Smartly",
                    textAlign: TextAlign.justify,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
