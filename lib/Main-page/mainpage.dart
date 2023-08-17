import 'package:flutter/material.dart';
import 'package:portfolio/Information/information.dart';
import 'package:portfolio/_models/ThemeM.dart';
import 'package:provider/provider.dart';

import '../SideNacBar/SidenavBar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Consumer<ThemeM>(builder: (context, provider, _) {
            return Image.asset(
              provider.currentTheme() == ThemeMode.dark
                  ? "assets/image/bg1.jpg"
                  : "assets/image/light1.jpg",
              height: size.height,
              width: size.width,
              fit: BoxFit.fill,
            );
          }),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: size.height * 0.8,
                    width: size.width * 0.3,
                    margin: const EdgeInsets.only(top: 20),
                    child: const SideNavBar(),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Information(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
