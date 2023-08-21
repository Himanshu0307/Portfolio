import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/_models/Project.dart';

class Projects extends StatefulWidget {
  Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects>
    with SingleTickerProviderStateMixin {
  List<Project> projects = [
    Project(
        name: "Wrecks",
        description:
            "The mobile application offers real-time monitoring of vehicle battery status, allowing users to track their battery's health and charge level remotely. Additionally, the app includes a feature that sends notifications to users when their vehicle has been hit or involved in an impact. This enhances vehicle security and helps users stay informed about potential incidents affecting their vehicle.",
        icon: FaIcon(FontAwesomeIcons.carBurst),
        time: "01/2023 - 02/2023",
        tech: ["Flutter", "Firebase"]),
    Project(
      name: "Backup Service",
      description:
          "A Windows Service application that automates the backup process by scheduling regular backups and transferring them to a target server using FTP. This solution enhances data security and efficiency by eliminating manual intervention and ensuring timely backups.",
      icon: FaIcon(FontAwesomeIcons.computer),
      tech: ["C#", "FTP Service"],
      time: "01/2023 - 02/2023",
    ),
    Project(
        name: "Lab Automation System",
        description:
            "Led a project focused on leveraging IoT technology to enable remote control of household appliances. Developed a system that empowers users to manage appliance states using their mobile devices, enhancing convenience and energy efficiency. This undertaking demonstrates my ability to innovate in the IoT domain while creating seamless user experiences.",
        icon: FaIcon(FontAwesomeIcons.wifi),
        time: "01/2023 - 02/2023",
        tech: ["Flask", "NodeMCU", "MQTT Protocol"]),
    Project(
        name: "Maze Solver",
        description:
            "A Bot that perform dry run and automatically find shortest path in a Maze",
        icon: FaIcon(FontAwesomeIcons.carOn),
        time: "2019-Tech Fest",
        tech: [
          "Arduino",
          "L298N Motor Driver",
          "IR sensors",
          "Left Hand Algorithm",
          "Right Hand Algorithm"
        ]),
    Project(
        name: "MAC Utility for Web",
        description:
            "A robust MAC-based security utility for web applications that enhances data protection and access control. User can set MAC(Media Access Control) based restriction in the web Application and filter the Access Control as per MAC Address",
        icon: FaIcon(FontAwesomeIcons.idBadge),
        time: "06/2023",
        tech: ["C#", "Window Service"]),
  ];

  int index = 0;
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: projects.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.6,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: NavigationRail(
                elevation: 3,
                backgroundColor: Theme.of(context).cardTheme.color,
                groupAlignment: 0,
                labelType: NavigationRailLabelType.selected,
                destinations: [
                  ...projects
                      .map((e) => NavigationRailDestination(
                          icon: e.icon, label: Text(e.name)))
                      .toList()
                ],
                selectedIndex: index,
                onDestinationSelected: (index) => {
                  setState(
                    () {
                      this.index = index;
                      controller.animateTo(index);
                    },
                  )
                },
              )),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TabBarView(controller: controller, children: [
                ...projects.map((e) {
                  return Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.38,
                        height: size.height * 0.8,
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50,
                                  ),
                                ),
                                Text(
                                  e.time,
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                                Text(
                                  e.description,
                                  textAlign: TextAlign.justify,
                                  softWrap: true,
                                ),
                                Text("Tech & Tools: ${e.tech.toString()}")
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }).toList()
              ]),
            ),
          )
        ],
      ),
    );
  }
}
