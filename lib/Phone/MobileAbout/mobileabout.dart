import 'package:flutter/material.dart';

class MobileAbout extends StatelessWidget {
  const MobileAbout({super.key});
  static const intro =
      "Hii, I'm Himanshu Sharma, a Techie by profession, a dedicated developer with a passion for turning lines of code into innovative solutions.\n ";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.5,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Card(
                elevation: 4,
                child: Placeholder(),
              )),
          Expanded(
              flex: 2,
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
