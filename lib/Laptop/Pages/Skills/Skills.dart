import 'package:flutter/material.dart';
import 'package:flutter_devicon/flutter_devicon.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});
  static const String about =
      "I'm Himanshu, \n a Full Stack Designer \n a Techie ";

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  var skills = const [
    Icon(
      FlutterDEVICON.csharp_line,
      size: 100.0,
    ),
    // Icon(
    //   FlutterDEVICON.django_line,
    //   size: 100.0,
    // ),
    Icon(
      FlutterDEVICON.flutter_plain,
      size: 100.0,
    ),
    Icon(
      FlutterDEVICON.python_plain,
      size: 100.0,
    ),

    Icon(
      FlutterDEVICON.angularjs_plain,
      size: 100.0,
    ),
    Icon(
      FlutterDEVICON.git_plain,
      size: 100.0,
    ),
  ];
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
    controller.dispose();
    super.dispose();
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          height: size.height * 0.3,
                          width: size.width * 0.5,
                          child: GridView.builder(
                              itemCount: skills.length,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      crossAxisSpacing: 30,
                                      mainAxisSpacing: 30,
                                      maxCrossAxisExtent: size.width *
                                          0.5 /
                                          (skills.length + 1)),
                              itemBuilder: (con, index) {
                                return skills[index];
                              }),
                        ),
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
