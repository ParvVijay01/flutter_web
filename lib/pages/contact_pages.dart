import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/text_button.dart';
import 'package:portfolio/components/text_form_field.dart';
import 'package:portfolio/routes/app_pages.dart';
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

  void _navigateTo(String route) {
    if (Get.currentRoute != route) {
      Get.offNamed(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                fontSize: screenWidth > 600 ? screenWidth * 0.03 : screenWidth * 0.06,
              ),
            ),
          ),
          
            actions: [
            if (screenWidth > 600) ...[
              MyTextButton(
                onPressed: () => _navigateTo(AppPages.HOME),
                text: "Home",
              ),
              const SizedBox(width: 10),
              MyTextButton(
                onPressed: () => _navigateTo(AppPages.GALLERY),
                text: "Gallery",
              ),
              const SizedBox(width: 10),
              MyTextButton(
                onPressed: () => _navigateTo(AppPages.ABOUT),
                text: "Contact",
              ),
              const SizedBox(width: 10),
            ] else ...[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: PopupMenuButton<String>(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onSelected: _navigateTo,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: AppPages.HOME,
                      child: const Text("Home"),
                    ),
                    PopupMenuItem(
                      value: AppPages.GALLERY,
                      child: const Text("Gallery"),
                    ),
                    PopupMenuItem(
                      value: AppPages.ABOUT,
                      child: const Text("Contact"),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            // Check if the screen is wide (e.g., for web or tablet)
            bool isWideScreen = constraints.maxWidth > 600;

            return isWideScreen
                ? Row(
                    children: [
                      // Left part: Phone and Mail
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    style: ButtonStyle(
                                      overlayColor: WidgetStateProperty
                                          .resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.hovered)) {
                                            return Theme.of(context)
                                                .colorScheme
                                                .primary;
                                          }
                                          return Theme.of(context)
                                              .colorScheme
                                              .surface;
                                        },
                                      ),
                                      foregroundColor: WidgetStateProperty
                                          .resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.hovered)) {
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
                                      overlayColor: WidgetStateProperty
                                          .resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.hovered)) {
                                            return Theme.of(context)
                                                .colorScheme
                                                .primary;
                                          }
                                          return Theme.of(context)
                                              .colorScheme
                                              .surface;
                                        },
                                      ),
                                      foregroundColor: WidgetStateProperty
                                          .resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.hovered)) {
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
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.015,
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
                                      overlayColor: WidgetStateProperty
                                          .resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.hovered)) {
                                            return Theme.of(context)
                                                .colorScheme
                                                .primary;
                                          }
                                          return Theme.of(context)
                                              .colorScheme
                                              .surface;
                                        },
                                      ),
                                      foregroundColor: WidgetStateProperty
                                          .resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.hovered)) {
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
                                      overlayColor: WidgetStateProperty
                                          .resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.hovered)) {
                                            return Theme.of(context)
                                                .colorScheme
                                                .primary;
                                          }
                                          return Theme.of(context)
                                              .colorScheme
                                              .surface;
                                        },
                                      ),
                                      foregroundColor: WidgetStateProperty
                                          .resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.hovered)) {
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
                                      "photography@garvchaplot.in",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.015,
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
                                      overlayColor: WidgetStateProperty
                                          .resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.hovered)) {
                                            return Theme.of(context)
                                                .colorScheme
                                                .primary;
                                          }
                                          return Theme.of(context)
                                              .colorScheme
                                              .surface;
                                        },
                                      ),
                                      foregroundColor: WidgetStateProperty
                                          .resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.hovered)) {
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
                                      Icons.location_on,
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: WidgetStateProperty
                                          .resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.hovered)) {
                                            return Theme.of(context)
                                                .colorScheme
                                                .primary;
                                          }
                                          return Theme.of(context)
                                              .colorScheme
                                              .surface;
                                        },
                                      ),
                                      foregroundColor: WidgetStateProperty
                                          .resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                          if (states
                                              .contains(WidgetState.hovered)) {
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
                                      "Udaipur, Rajasthan",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.015,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Right part: Form
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: _ContactForm(),
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top part: Phone and Mail
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  style: ButtonStyle(
                                    overlayColor:
                                        WidgetStateProperty.resolveWith<Color>(
                                      (Set<WidgetState> states) {
                                        if (states
                                            .contains(WidgetState.hovered)) {
                                          return Theme.of(context)
                                              .colorScheme
                                              .primary;
                                        }
                                        return Theme.of(context)
                                            .colorScheme
                                            .surface;
                                      },
                                    ),
                                    foregroundColor:
                                        WidgetStateProperty.resolveWith<Color>(
                                      (Set<WidgetState> states) {
                                        if (states
                                            .contains(WidgetState.hovered)) {
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
                                    overlayColor:
                                        WidgetStateProperty.resolveWith<Color>(
                                      (Set<WidgetState> states) {
                                        if (states
                                            .contains(WidgetState.hovered)) {
                                          return Theme.of(context)
                                              .colorScheme
                                              .primary;
                                        }
                                        return Theme.of(context)
                                            .colorScheme
                                            .surface;
                                      },
                                    ),
                                    foregroundColor:
                                        WidgetStateProperty.resolveWith<Color>(
                                      (Set<WidgetState> states) {
                                        if (states
                                            .contains(WidgetState.hovered)) {
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
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
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
                                    overlayColor:
                                        WidgetStateProperty.resolveWith<Color>(
                                      (Set<WidgetState> states) {
                                        if (states
                                            .contains(WidgetState.hovered)) {
                                          return Theme.of(context)
                                              .colorScheme
                                              .primary;
                                        }
                                        return Theme.of(context)
                                            .colorScheme
                                            .surface;
                                      },
                                    ),
                                    foregroundColor:
                                        WidgetStateProperty.resolveWith<Color>(
                                      (Set<WidgetState> states) {
                                        if (states
                                            .contains(WidgetState.hovered)) {
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
                                    overlayColor:
                                        WidgetStateProperty.resolveWith<Color>(
                                      (Set<WidgetState> states) {
                                        if (states
                                            .contains(WidgetState.hovered)) {
                                          return Theme.of(context)
                                              .colorScheme
                                              .primary;
                                        }
                                        return Theme.of(context)
                                            .colorScheme
                                            .surface;
                                      },
                                    ),
                                    foregroundColor:
                                        WidgetStateProperty.resolveWith<Color>(
                                      (Set<WidgetState> states) {
                                        if (states
                                            .contains(WidgetState.hovered)) {
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
                                    "chaplot.garv@gmail.com",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      // Bottom part: Form
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: _ContactForm(),
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

class _ContactForm extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController msgController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name Field
          const Text(
            "Name",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          TextFormFieldComp(
            hintText: "Enter your name",
            controller: nameController,
          ),
          const SizedBox(height: 16),
          // Email Field
          const Text(
            "Email",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          TextFormFieldComp(
            hintText: "Enter your email",
            controller: emailController,
          ),
          const SizedBox(height: 16),
          // Message Field
          const Text(
            "Message",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          TextFormFieldComp(
            hintText: "Enter your message",
            maxLines: 5,
            controller: msgController,
          ),
          const SizedBox(height: 16),
          // Submit Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle form submission
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}
