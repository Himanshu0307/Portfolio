import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Connect extends StatefulWidget {
  Connect({super.key});

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  final keyform = GlobalKey<FormState>();

  late TextEditingController name;

  late TextEditingController purpose;

  late TextEditingController description;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    purpose = TextEditingController();
    description = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    purpose.dispose();
    description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.3,
      child: Form(
        key: keyform,
        child: Padding(
          padding:
              EdgeInsets.only(left: size.width * 0.2, right: size.width * 0.2),
          child: Column(
            children: [
              TextFormField(
                controller: name,
                autofocus: true,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Required";
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: "Please Enter User Name", labelText: "User Name"),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) return "Required";
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: "Please Enter Email Address",
                    labelText: "Email Address"),
              ),
              TextFormField(
                controller: purpose,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Required";
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: "Please Provide Subject", labelText: "Subject"),
              ),
              TextFormField(
                controller: description,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Required";
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
                          "mailto:himanshusharma.cse23@jecrc.ac.in?subject=${purpose.text}&body=Name:${name.text}Description:${description.text}";
                      launchUrl(Uri.parse(url));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
  }
}
