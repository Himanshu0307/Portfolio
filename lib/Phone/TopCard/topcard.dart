import 'package:flutter/material.dart';
import "package:portfolio/_models/Quote.dart";
import 'dart:math';

class TopCard extends StatelessWidget {
  const TopCard({super.key});

  @override
  Widget build(BuildContext context) {
    int inde = Random().nextInt(50);
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.35,
      width: size.width,
      child: Stack(
        children: [
          Card(
            elevation: 6,
            child: Image.asset(
              "assets/image/mountain2.jpg",
              fit: BoxFit.fitHeight,
              color: Colors.blueGrey.shade600,
              colorBlendMode: BlendMode.color,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: size.height * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  motivationalQuotes[inde]["quote"]!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "-" + motivationalQuotes[inde]["author"]!,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          )
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     CircleAvatar(
          //       // backgroundColor: Colors.orange.shade600,
          //       backgroundImage: Image.asset(
          //         "assets/image/profile.jpg",
          //         width: 100,
          //         height: 100,
          //       ).image,
          //     ),
          //     // Text("Himanshu Sharma"),
          //     // Text("A Developer ")
          //   ],
          // )
        ],
      ),
    );
  }
}
