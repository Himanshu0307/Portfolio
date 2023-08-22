import 'package:flutter/material.dart';
import 'package:portfolio/_models/Skills.dart';

class MObileSkills extends StatefulWidget {
  MObileSkills({super.key});

  @override
  State<MObileSkills> createState() => _MObileSkillsState();
}

class _MObileSkillsState extends State<MObileSkills> {
  final List<SkillsModel> skill = [
    SkillsModel(title: "Flutter", progress: 0.8),
    SkillsModel(title: "HTML & CSS", progress: 0.7),
    SkillsModel(title: "Angular", progress: 0.7),
    SkillsModel(title: "C#", progress: 0.65),
    SkillsModel(title: "Java", progress: 0.65),
    SkillsModel(title: "Python", progress: 0.7),
    SkillsModel(title: "SQL Server", progress: 0.5),
    SkillsModel(title: "Arduino", progress: 0.5),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // return SizedBox(
    //   height: size.height * 0.5,
    //   child: const Row(
    //     children: [
    //       Expanded(
    //           flex: 1,
    //           child: Column(
    //             children: [
    //               Text("About"),
    //               Text(
    //                   "Sdfsdkjfhsjkfhskfhkjshfjksfjkhsfkjhsjkfhsdkfhskdhfkjshfkjshdf")
    //             ],
    //           )),
    //       Expanded(
    //           flex: 2,
    //           child: Column(
    //             children: [
    //               Text("About"),
    //               Text(
    //                   "Sdfsdkjfhsjkfhskfhkjshfjksfjkhsfkjhsjkfhsdkfhskdhfkjshfkjshdf")
    //             ],
    //           ))
    //     ],
    //   ),
    // );
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: SizedBox(
              height: size.height * 0.6,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: skill.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 50,
                    maxCrossAxisExtent: (size.width * 0.75) / 3),
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircularProgressIndicator(
                          value: skill[index].progress,
                          strokeWidth: 10,
                          color: Theme.of(context).progressIndicatorTheme.color,
                        ),
                        Text(
                          skill[index].title,
                          softWrap: false,
                        )
                      ],
                    ),
                  );
                },
              ),
            )),
        Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: RotatedBox(
                quarterTurns: 1,
                child: Text("Skills"),
              ),
            ))
      ],
    );
  }
}
