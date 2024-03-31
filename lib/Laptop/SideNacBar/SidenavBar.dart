import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore_for_file: prefer_const_constructors
class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage("assets/image/profile.jpg"),
            ),
          ),
          Text("Himanshu Sharma",
              style: Theme.of(context).textTheme.displaySmall),
          TextButton.icon(
            icon: Icon(Icons.mail),
            label: Text(
              "sharmaHimanshu030700@gmail.com",
              style: Theme.of(context).textTheme.labelMedium,
              softWrap: false,
            ),
            onPressed: null,
          ),
          TextButton.icon(
            icon: Icon(Icons.call),
            label: Text(
              "+91-8003412098",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            onPressed: null,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    launchUrl(Uri.parse(
                        "http://www.linkedin.com/in/himanshu-sharma098"));
                  },
                  icon: FaIcon(FontAwesomeIcons.linkedin)),
              IconButton(
                  onPressed: () {
                    launchUrl(Uri.parse("https://github.com/Himanshu0307"));
                  },
                  icon: FaIcon(FontAwesomeIcons.github)),
              IconButton(
                  onPressed: () {
                    launchUrl(Uri.parse("https://www.instagram.com/anshh_im/"));
                  },
                  icon: FaIcon(FontAwesomeIcons.instagram)),
              IconButton(
                  onPressed: () {
                    launchUrl(Uri.parse("https://wa.me/918003412098"));
                  },
                  icon: FaIcon(FontAwesomeIcons.whatsapp)),
              // IconButton(onPressed: () {}, icon: Icon(Icons.download)),
            ],
          )
        ],
      ),
    );
  }
}
