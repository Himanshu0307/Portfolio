import 'package:flutter/material.dart';
import 'package:portfolio/Pages/Projects/project.dart';
import 'package:portfolio/Pages/Connect/connect.dart';
import 'package:portfolio/Pages/Experience/experience.dart';
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
              TextButton(
                  onPressed: () => {
                        controller.animateToPage(0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn)
                      },
                  child: const Text("About")),
              TextButton(
                  onPressed: () => {
                        controller.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn)
                      },
                  child: const Text("Experience")),
              TextButton(
                  onPressed: () => {
                        controller.animateToPage(2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn)
                      },
                  child: const Text("Projects")),
              TextButton(
                  onPressed: () => {
                        controller.animateToPage(3,
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
            width: size.width * 0.6,
            height: size.height * 0.8,
            child: PageView(
              scrollDirection: Axis.vertical,
              controller: controller,
              children: [const About(), Experience(), Projects(), Connect()],
            ),
          ),
        )
      ],
    );
  }
}
