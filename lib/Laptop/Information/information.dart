import 'package:flutter/material.dart';
import 'package:portfolio/Laptop/Pages/Projects/project.dart';
import 'package:portfolio/Laptop/Pages/Connect/connect.dart';
import 'package:portfolio/Laptop/Pages/Experience/experience.dart';
import 'package:portfolio/Laptop/Pages/Skills/Skills.dart';
import 'package:portfolio/_models/ThemeM.dart';
import 'package:provider/provider.dart';

import '../Pages/About/about.dart';

class Information extends StatelessWidget {
  Information({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PageController controller = PageController();
    return Column(
      children: [
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () => {
                        controller.animateToPage(0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn)
                      },
                  child: const Text("About")),
              ElevatedButton(
                  onPressed: () => {
                        controller.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn)
                      },
                  child: const Text("Skills")),
              ElevatedButton(
                  onPressed: () => {
                        controller.animateToPage(2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn)
                      },
                  child: const Text("Throwback")),
              ElevatedButton(
                  onPressed: () => {
                        controller.animateToPage(3,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn)
                      },
                  child: const Text("Projects")),
              ElevatedButton(
                  onPressed: () => {
                        controller.animateToPage(4,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn)
                      },
                  child: const Text("Connect")),
              Consumer<ThemeM>(builder: (context, provider, _) {
                return Switch(
                  value: provider.currentTheme() == ThemeMode.dark,
                  onChanged: (isD) {
                    if (isD == true) {
                      provider.setDarkMode();
                    } else {
                      provider.setLightMode();
                    }
                  },
                );
              })
            ],
          ),
        ),
        Card(
          child: SizedBox(
            height: size.height * 0.85,
            child: PageView(
              scrollDirection: Axis.vertical,
              controller: controller,
              children: [
                const About(),
                const Skills(),
                Experience(),
                Projects(),
                Connect()
              ],
            ),
          ),
        )
      ],
    );
  }
}
