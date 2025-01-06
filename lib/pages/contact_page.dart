import 'package:flutter/material.dart';
import 'package:portfolio/components/text_button.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 100,
          leadingWidth: 100,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              "GARV CHAPLOT",
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.03,
              ),
            ),
          ),
          actions: [
            MyTextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              text: "Home",
            ),
            const SizedBox(width: 10),
            MyTextButton(onPressed: () {}, text: "Gallery"),
            const SizedBox(width: 10),
            MyTextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactPage(),
                    ),
                  );
                },
                text: "Contact"),
            const SizedBox(width: 10),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 5, 5, 5),
          child: Column(
            children: [
              Text(
                "Contact  - ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.02,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  IconButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.hovered)) {
                            return Theme.of(context).colorScheme.primary;
                          }
                          return Theme.of(context).colorScheme.surface;
                        },
                      ),
                      foregroundColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.hovered)) {
                            return Colors.black;
                          }
                          return Colors.white;
                        },
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _makePhoneCall('tel: +91 7014966793');
                      });
                    },
                    icon: Icon(
                      Icons.phone,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.hovered)) {
                            return Theme.of(context).colorScheme.primary;
                          }
                          return Theme.of(context).colorScheme.surface;
                        },
                      ),
                      foregroundColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.hovered)) {
                            return Colors.black;
                          }
                          return Colors.white;
                        },
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _makePhoneCall('tel: +91 7014966793');
                      });
                    },
                    child: Text(
                      "+91 7014966793",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.015,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  IconButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.hovered)) {
                            return Theme.of(context).colorScheme.primary;
                          }
                          return Theme.of(context).colorScheme.surface;
                        },
                      ),
                      foregroundColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.hovered)) {
                            return Colors.black;
                          }
                          return Colors.white;
                        },
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _makePhoneCall('tel: +91 7014966793');
                      });
                    },
                    icon: Icon(
                      Icons.mail,
                    ),
                  ),
                  TextButton(
                      style: ButtonStyle(
                        overlayColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.hovered)) {
                              return Theme.of(context).colorScheme.primary;
                            }
                            return Theme.of(context).colorScheme.surface;
                          },
                        ),
                        foregroundColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.hovered)) {
                              return Colors.black;
                            }
                            return Colors.white;
                          },
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _makePhoneCall('tel: +91 7014966793');
                        });
                      },
                      child: Text(
                        "+91 7014966793",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.015,
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
