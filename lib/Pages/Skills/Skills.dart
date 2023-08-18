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
  var skills = [
    Icon(FlutterDEVICON.csharp_line),
    Icon(FlutterDEVICON.django_line),
    Icon(FlutterDEVICON.flutter_plain),
    Icon(FlutterDEVICON.python_plain),
    Icon(FlutterDEVICON.dot_net_plain),
    Icon(FlutterDEVICON.angularjs_plain),
    Icon(FlutterDEVICON.git_plain),
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
                      // Row(
                      //   children: [
                      //     Icon(FlutterDEVICON.csharp_line),
                      //     Icon(FlutterDEVICON.flutter_plain),
                      //     Icon(FlutterDEVICON.angularjs_plain),
                      //     Icon(FlutterDEVICON.python_plain),
                      //     Icon(FlutterDEVICON.django_line),

                      //   ],
                      // )
                      Expanded(
                        flex: 1,
                        child: GridView.builder(
                            itemCount: skills.length,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent:
                                        skills.length.toDouble()),
                            itemBuilder: (con, index) {
                              return skills[index];
                            }),
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
