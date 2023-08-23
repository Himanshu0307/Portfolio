import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/Phone/MobileAbout/mobileabout.dart';
import 'package:portfolio/Phone/MobileSkills/mobile_skills.dart';
import 'package:portfolio/Phone/MobileThrowBacks/mobile_Throw.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../_models/Quote.dart';
import '../MobileProjects/mobileProject.dart';

class MobileMain extends StatelessWidget {
  MobileMain({super.key});
  final List<Widget> widget = [
    MobileAbout(),
    MobileThrowBack(),
    MobileProject(),
    MObileSkills()
  ];
  // ListView.builder(
  //         padding: EdgeInsets.only(bottom: 20, left: 4, right: 4),
  //         itemBuilder: (context, index) {
  //           return widget[index];
  //         },
  //         itemCount: widget.length,
  //       ),
  final keyform = GlobalKey<FormState>();

  late TextEditingController name = TextEditingController();

  late TextEditingController purpose = TextEditingController();

  late TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int inde = Random().nextInt(50);
    return Scaffold(
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: size.height * 0.30,
                collapsedHeight: 20,
                toolbarHeight: 0,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    motivationalQuotes[inde]["quote"]! +
                        "\n-" +
                        motivationalQuotes[inde]["author"]!,
                    style: Theme.of(context).textTheme.bodySmall!.merge(
                        TextStyle(fontSize: 7, fontFamily: "Pacifico-Regular")),
                    textAlign: TextAlign.end,
                  ),
                  stretchModes: [
                    // StretchMode.blurBackground,
                    // StretchMode.zoomBackground,
                    StretchMode.fadeTitle
                  ],
                  background: Image.asset(
                    "assets/image/mountain2.jpg",
                    // fit: BoxFit.fitHeight,
                    color: Colors.blueGrey.shade600,
                    colorBlendMode: BlendMode.color,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => widget[index]),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.only(
                      left: 7,
                      right: 7,
                      top: 3,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  height: 400 + MediaQuery.of(context).viewInsets.bottom,
                  child: Form(
                    key: keyform,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: name,
                            autofocus: true,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Required";
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "Please Enter User Name",
                                labelText: "User Name"),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Required";
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "Please Enter Email Address",
                                labelText: "Email Address"),
                          ),
                          TextFormField(
                            controller: purpose,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Required";
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "Please Provide Subject",
                                labelText: "Subject"),
                          ),
                          TextFormField(
                            controller: description,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Required";
                              return null;
                            },
                            maxLines: 6,
                            minLines: 1,
                            decoration: const InputDecoration(
                                hintText: "Please Enter your query",
                                labelText: "Description"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (keyform.currentState!.validate()) {
                                  var url =
                                      "mailto:himanshusharma.cse23@jecrc.ac.in?subject=${purpose.text}&body=Name:${name.text} Description:${description.text}";
                                  launchUrl(Uri.parse(url));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Thanks for contacting. User will soon reply through Mail")));
                                }
                              },
                              child: const Text("Let's Talk"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
