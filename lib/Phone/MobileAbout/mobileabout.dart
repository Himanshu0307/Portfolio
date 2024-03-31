import 'package:flutter/material.dart';

class MobileAbout extends StatelessWidget {
  const MobileAbout({super.key});
  static const intro =
      "Hii, I'm Himanshu Sharma, a Techie by profession, a dedicated developer with a passion for turning lines of code into innovative solutions.\n ";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      // height: size.height * 0.5,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Card(
                child: Image.asset(
                  "assets/image/image1.png",
                  color: Colors.black87,
                  colorBlendMode: BlendMode.color,
                ),
              )),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text("About",
                      style: Theme.of(context).textTheme.displayMedium!),
                  Text(
                    intro,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .merge(TextStyle(fontFamily: "Pacifico-Regular")),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
