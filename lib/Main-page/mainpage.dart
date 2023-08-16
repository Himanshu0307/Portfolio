import 'package:flutter/material.dart';
import 'package:portfolio/Information/information.dart';

import '../SideNacBar/SidenavBar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
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
    );
  }
}
