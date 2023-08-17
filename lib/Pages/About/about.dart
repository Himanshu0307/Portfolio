import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});
  static const String about = "I'm Himanshu, \n a UI/UX designer \n a Techie ";

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

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
              SizedBox(
                width: size.width * 0.5,
                height: size.height * 0.8,
                child: FadeTransition(
                  opacity: animation,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hello!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 70,
                        ),
                      ),
                      Text(
                        About.about,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
