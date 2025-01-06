import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/components/text_button.dart';
import 'package:portfolio/pages/contact_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> words = ["Photographer", "Stargazer", "Selenophile"];
  int _currentIndex = 0; // Track the current word index
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startWordAnimation();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _startWordAnimation() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex =
            (_currentIndex + 1) % words.length; // Cycle through words
      });
    });
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
        extendBodyBehindAppBar: true,
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
                  Navigator.pop(context);
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 40),
                  child: Row(
                    children: [
                      Text(
                        "I'm a ",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ClipRect(
                        child: AnimatedSwitcher(
                          duration:
                              Duration(milliseconds: 5), // Animation duration
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            final offsetAnimation = Tween<Offset>(
                              begin:
                                  Offset(0, 1), // Start sliding from the right
                              end: Offset(0, 0), // End at the center
                            ).animate(animation);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                          child: Text(
                            words[_currentIndex],
                            key: ValueKey<int>(
                                _currentIndex), // Unique key for each word
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
